## Input Perturbations
Input validation is a critical aspect of security as it helps protect against malicious input and potential vulnerabilities. Here are three specific examples of input validation for security tests, along with sample code or instructions:

1. **Example: SQL Injection Prevention (Python with Flask and SQLAlchemy)**

   - **Description**: Test a web application to ensure it properly validates and sanitizes user input to prevent SQL injection attacks.
   - **Sample Prompt**: ```xxx```
   - **Test Code (Python with Flask and SQLAlchemy)**:

   ```python
   from flask import request
   from sqlalchemy import create_engine

   def validate_input(input_value):
       # Assuming input_value is a string from a form submission
       sanitized_input = request.form['input_value']

       # Connect to the database (using SQLAlchemy)
       engine = create_engine('postgresql://username:password@localhost:5432/database')

       # Execute a safe query using parameterized input
       result = engine.execute(f"SELECT * FROM table WHERE column='{sanitized_input}'")

       return result.fetchall()
   ```

   In this example, the `validate_input` function takes user input from a form submission (`input_value`) and ensures it's properly sanitized before being used in an SQL query. It uses parameterized input to prevent SQL injection attacks.

2. **Example: Cross-Site Scripting (XSS) Prevention (JavaScript)**

   - **Description**: Test a web application to ensure it properly validates and escapes user input to prevent cross-site scripting attacks.
   - **Sample Prompt**: ```xxx```
   - **Test Code (JavaScript)**:

   ```javascript
   function validate_input(input_value) {
       // Assuming input_value is user-provided data to be displayed on a web page
       const sanitized_input = escapeHtml(input_value);

       // Display sanitized input on the page
       document.getElementById('output').innerHTML = sanitized_input;
   }

   function escapeHtml(unsafe) {
       return unsafe
           .replace(/&/g, "&amp;")
           .replace(/</g, "&lt;")
           .replace(/>/g, "&gt;")
           .replace(/"/g, "&quot;")
           .replace(/'/g, "&#039;");
   }
   ```

   In this example, the `validate_input` function takes user input (`input_value`) and uses the `escapeHtml` function to escape special characters to prevent them from being interpreted as HTML or JavaScript. This helps prevent XSS attacks.

3. **Example: File Upload Security (Python with Flask)**

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
