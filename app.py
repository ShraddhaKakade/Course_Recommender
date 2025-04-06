from flask import Flask, render_template, request, jsonify, session, redirect, url_for
from flask_mysqldb import MySQL
import MySQLdb.cursors
from transformers import pipeline
import os
from dotenv import load_dotenv
from langchain_anthropic import ChatAnthropic
from langchain_core.messages import SystemMessage, HumanMessage

# Load environment variables
load_dotenv()

app = Flask(__name__)
app.secret_key = 'your_secret_key'

# MySQL Config
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'course_recommender'

mysql = MySQL(app)


claude_llm = ChatAnthropic(
    model="claude-3-5-sonnet-20241022",
    api_key=os.getenv("ANTHROPIC_API_KEY")
)

@app.route('/')
def home():
    return render_template('form.html')

@app.route('/submit', methods=['POST'])
def submit_form():
    student_name = request.form['student_name']
    student_email = request.form['email']

    # Query to check if both name and email match
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM Student WHERE student_name = %s AND email = %s", (student_name, student_email))
    student = cursor.fetchone()

    # Check if both fields are entered
    if not student_name or not student_email:
        return "Please enter both your name and email."

    if student:
    # Save the student ID in session and redirect to chatbot
        session['student_id'] = student['student_id']
        return redirect(url_for('chatbot'))
    else:
    # If no match is found, display an error message
        return render_template('form_page.html', error="Student name and email do not match any record in the database.")

@app.route('/chatbot')
def chatbot():
    student_id = session.get('student_id')
    if not student_id:
        return redirect(url_for('home'))

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM Student WHERE student_id = %s", (student_id,))
    student = cursor.fetchone()
    return render_template('chatbot.html', student=student)

def get_student_data(student_id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM Student WHERE student_id = %s", (student_id,))
    student = cursor.fetchone()

    cursor.execute("SELECT c.course_id FROM Course c JOIN EnrollmentHistory e ON c.course_id = e.course_id WHERE e.student_id = %s", (student_id,))
    taken = cursor.fetchall()

    taken_courses = [row['course_id'] for row in taken]
    student['taken_courses'] = taken_courses

    return student

def recommend_courses(student_id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    cursor.execute("SELECT course_id FROM EnrollmentHistory WHERE student_id = %s", (student_id,))
    taken = [row['course_id'] for row in cursor.fetchall()]

    cursor.execute("SELECT * FROM Course")
    all_courses = cursor.fetchall()

    new_courses = [c for c in all_courses if c['course_id'] not in taken]
    return new_courses[:3]

def generate_response_with_profile(user_query, student_profile, recommended_courses):
    # Add explicit database context
    context = f"""
    [SYSTEM PROMPT]
    You are a university course advisor with direct access to the MySQL database containing:
    - Student profiles (table: Student)
    - Course catalog (table: Course) 
    - Enrollment records (table: EnrollmentHistory)
    
    Current Student Data from DB:
    ID: {student_profile['student_id']}
    Name: {student_profile['student_name']}
    Career Goal: {student_profile['career_goal']}
    Completed Courses: {', '.join(map(str, student_profile['taken_courses']))}
    Recommended Courses: {', '.join([c['course_name'] for c in recommended_courses])}
    """
    
    # Add response guidance
    messages = [
        SystemMessage(content=context),
        HumanMessage(content=f"User Question: {user_query}\n\nAlways reference database data in responses.")
    ]
    
    try:
        response = claude_llm.invoke(messages)
        return response.content
    except Exception as e:
        return f"Error generating response: {str(e)}"


@app.route('/chat', methods=['POST'])
def chat():
    user_input = request.json['message']
    student_id = session.get('student_id')

    if not student_id:
        return jsonify({'response': 'Student not found in session.'})

    student_profile = get_student_data(student_id)
    recommended_courses = recommend_courses(student_id)

    reply = generate_response_with_profile(user_input, student_profile, recommended_courses)
    return jsonify({'response': reply})


if __name__ == '__main__':
    app.run(debug=True)
