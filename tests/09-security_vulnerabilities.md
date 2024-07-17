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

1. **Example: SQL Injection Vulnerability**

   - **Description**: Test a web application for vulnerabilities related to SQL Injection, where an attacker manipulates input to execute malicious SQL queries.
   - **Sample Prompt**: 
   - **Test Code (Python with Flask and SQLAlchemy)**:

   ```python
   # Example vulnerable code
   from flask import request

   def execute_query(user_input):
       query = f"SELECT * FROM users WHERE username='{user_input}'"
       # Execute the query

   # Injected malicious input by an attacker
   malicious_input = "' OR '1'='1'; DROP TABLE users; --"
   execute_query(malicious_input)
   ```

   In this example, an attacker injects a malicious SQL query that could lead to unintended consequences. This can be tested by injecting the malicious input and observing if it affects the database.

2. **Example: Remote Code Execution (RCE) Vulnerability**

   - **Description**: Test a system for vulnerabilities related to Remote Code Execution, where an attacker can execute arbitrary code on a server.
   - **Sample Prompt**: 
   - **Test Code (Python)**:

   ```python
   # Example vulnerable code
   def process_user_input(input_data):
       exec(input_data)

   # Injected malicious code by an attacker
   malicious_code = "__import__('os').system('rm -rf /')"
   process_user_input(malicious_code)
   ```

   In this example, an attacker injects code that could potentially have destructive effects. This can be tested by injecting the malicious code and observing if it executes on the server.

It's important to note that these examples demonstrate how vulnerabilities can be exploited adversarially. In practice, identifying and mitigating such vulnerabilities is critical to ensuring the security of applications and systems. Security testing should be conducted responsibly and with proper authorization.
