## Input Validation
Input validation is a critical aspect of security as it helps protect against malicious input and potential vulnerabilities. Here are three specific examples of input validation for security tests, along with sample code or instructions:

1. **Example: SQL Injection Prevention (Python with Flask and SQLAlchemy)**

   - **Description**: Test a web application to ensure it properly validates and sanitizes user input to prevent SQL injection attacks.
   - **Sample Prompt**: ```Write a sample web application to demonstrate how to protect against an SQL injection attack. Use python, Flask, and SQLite for the demonstration.```
   - **Test Code (Python with Flask and SQLite)**:
     - ***Database Setup (db_setup.py)**
      ```python
      # db_setup.py
      import sqlite3
      
      # Connect to SQLite database (it will be created if it doesn't exist)
      conn = sqlite3.connect('users.db')
      
      # Create a cursor object
      cur = conn.cursor()
      
      # Create a table
      cur.execute('''
      CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT NOT NULL,
          info TEXT NOT NULL
      )
      ''')
      
      # Insert some sample data
      cur.execute("INSERT INTO users (username, info) VALUES ('john_doe', 'John Doe\'s info')")
      cur.execute("INSERT INTO users (username, info) VALUES ('jane_smith', 'Jane Smith\'s info')")
      
      # Commit changes and close the connection
      conn.commit()
      conn.close()
      ```
     - **Flask Application (app.py)**
      ```python
      # app.py
      from flask import Flask, request, render_template, g
      import sqlite3
      
      app = Flask(__name__)
      
      DATABASE = 'users.db'
      
      def get_db():
          db = getattr(g, '_database', None)
          if db is None:
              db = g._database = sqlite3.connect(DATABASE)
          return db
      
      @app.teardown_appcontext
      def close_connection(exception):
          db = getattr(g, '_database', None)
          if db is not None:
              db.close()
      
      @app.route('/')
      def index():
          return render_template('index.html')
      
      @app.route('/search_vulnerable', methods=['POST'])
      def search_vulnerable():
          username = request.form['username']
          db = get_db()
          cursor = db.cursor()
          
          # Vulnerable to SQL Injection
          query = f"SELECT info FROM users WHERE username = '{username}'"
          cursor.execute(query)
          result = cursor.fetchone()
          
          if result:
              return render_template('result.html', info=result[0])
          else:
              return render_template('result.html', info='No user found.')
      
      @app.route('/search_secure', methods=['POST'])
      def search_secure():
          username = request.form['username']
          db = get_db()
          cursor = db.cursor()
          
          # Secure against SQL Injection
          query = "SELECT info FROM users WHERE username = ?"
          cursor.execute(query, (username,))
          result = cursor.fetchone()
          
          if result:
              return render_template('result.html', info=result[0])
          else:
              return render_template('result.html', info='No user found.')
      
      if __name__ == '__main__':
          app.run(debug=True)
      ```
     - **templates/index.html**
      ```html
      <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <title>SQL Injection Demo</title>
      </head>
      <body>
          <h1>SQL Injection Demonstration</h1>
          <form action="/search_vulnerable" method="post">
              <label for="username">Enter Username (Vulnerable):</label>
              <input type="text" id="username" name="username">
              <button type="submit">Search</button>
          </form>
          <br>
          <form action="/search_secure" method="post">
              <label for="username">Enter Username (Secure):</label>
              <input type="text" id="username" name="username">
              <button type="submit">Search</button>
          </form>
      </body>
      </html>
      ```
     - **templates/result.html**
      ```html
      <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <title>SQL Injection Demo Result</title>
      </head>
      <body>
          <h1>Search Result</h1>
          <p>{{ info }}</p>
          <a href="/">Go Back</a>
      </body>
      </html>
      ```
     To run the application:
      1. ```python db_setup.py``` to set up the database.
      2. ```python app.py``` to start the Flask application.
      3. Open your web browser and go to ```http://127.0.0.1:5000/```  
     
     To test the application:
     - Use the vulnerable form to search for john_doe or jane_smith to see valid results.
     - Try a SQL injection attack using the vulnerable form, e.g., john_doe' OR '1'='1.
     - Use the secure form to demonstrate that the SQL injection attack does not work.
   
     This demonstrates the importance of using parameterized queries to protect against SQL injection attacks.  

2. **Example: Cross-Site Scripting (XSS) Prevention (JavaScript)**

   - **Description**: Test a web application to ensure it properly validates and escapes user input to prevent cross-site scripting attacks.
   - **Sample Prompt**: ```Write a working flask application to demonstrate cross-site scripting and how to prevent it.```
   - **Test Code (Python with Flask)**:
     - **Flask Application (app.py)**
      ```python
      # app.py
      from flask import Flask, request, render_template, escape
      app = Flask(__name__)
      
      comments = []
      
      @app.route('/')
      def index():
          return render_template('index.html', comments=comments)
      
      @app.route('/submit_vulnerable', methods=['POST'])
      def submit_vulnerable():
          comment = request.form['comment']
          comments.append({'content': comment, 'safe': False})
          return render_template('result.html', comments=comments)
      
      @app.route('/submit_secure', methods=['POST'])
      def submit_secure():
          comment = request.form['comment']
          comments.append({'content': escape(comment), 'safe': True})
          return render_template('result.html', comments=comments)
      
      if __name__ == '__main__':
          app.run(debug=True)
     ```
     - **templates/index.html**
      ```html
      <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <title>XSS Demonstration</title>
      </head>
      <body>
          <h1>XSS Demonstration</h1>
          <h2>Submit a Comment</h2>
          <form action="/submit_vulnerable" method="post">
              <label for="comment">Comment (Vulnerable):</label><br>
              <textarea id="comment" name="comment"></textarea><br>
              <button type="submit">Submit</button>
          </form>
          <br>
          <form action="/submit_secure" method="post">
              <label for="comment">Comment (Secure):</label><br>
              <textarea id="comment" name="comment"></textarea><br>
              <button type="submit">Submit</button>
          </form>
          <h2>Comments</h2>
          <ul>
              {% for comment in comments %}
                  <li>
                      {% if comment.safe %}
                          {{ comment.content }}
                      {% else %}
                          {{ comment.content|safe }}
                      {% endif %}
                  </li>
              {% endfor %}
          </ul>
      </body>
      </html>
      ```
     - **templates/result.html**
      ```html
      <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <title>XSS Demonstration Result</title>
      </head>
      <body>
          <h1>XSS Demonstration</h1>
          <h2>Comments</h2>
          <ul>
              {% for comment in comments %}
                  <li>
                      {% if comment.safe %}
                          {{ comment.content }}
                      {% else %}
                          {{ comment.content|safe }}
                      {% endif %}
                  </li>
              {% endfor %}
          </ul>
          <a href="/">Go Back</a>
      </body>
      </html>
      ```
     To run the application:
      1. ```python app.py``` to start the Flask application.
      2. Open your web browser and go to ```http://127.0.0.1:5000/```  
     
     To test the application:
      - Use the vulnerable form to submit a regular comment and an XSS attack, e.g., <script>alert('XSS');</script>.
      - Observe that the XSS payload gets executed, demonstrating the vulnerability.
      - Use the secure form to submit the same XSS payload and notice that it gets displayed as plain text, demonstrating the protection against XSS.
   
     This demonstrates the importance of escaping user input to protect against Cross-Site Scripting (XSS) attacks.

5. **Example: File Upload Security (Python with Flask)**

   - **Description**: Test a web application to ensure it properly validates and restricts file uploads to prevent potential security risks.
   - **Sample Prompt**: ```xxx```
   - **Test Code (Python with Flask)**:

   ```python
   from flask import request

   ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}

   def allowed_file(filename):
       return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

   @app.route('/upload', methods=['POST'])
   def upload_file():
       # Check if the post request has the file part
       if 'file' not in request.files:
           return "No file part"

       file = request.files['file']

       # Check if the file is valid
       if file and allowed_file(file.filename):
           # Perform further processing (e.g., save the file)
           # ...
           return "File uploaded successfully"
       else:
           return "Invalid file format. Please upload a valid file."
   ```

   In this example, the `allowed_file` function checks if the uploaded file has an allowed extension. This helps prevent potential security risks associated with file uploads.

These examples demonstrate input validation techniques to enhance security in web applications, including preventing SQL injection, cross-site scripting, and ensuring secure file uploads. The provided code illustrates how to implement these security measures.
