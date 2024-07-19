## Error Messages
Error messages play a crucial role in providing feedback to users and developers when something goes wrong. Here are three specific examples of error messages for error handling tests, along with sample code or instructions:

1. **Example: Input Validation Error Message (Python)**

   - **Description**: Test a function that validates user input and returns an error message if the input is invalid.
   - **Sample prompt**: ```Write a python script that demonstrates validating user input and returning an error message if the input is invalid.```
   - **Test Code (Python)**:

   ```python
   def validate_age(age):
       try:
           age = int(age)
           if age < 0 or age > 120:
               return False, "Age must be between 0 and 120."
           return True, age
       except ValueError:
           return False, "Please enter a valid integer for age."
   
   def validate_email(email):
       if '@' not in email or '.' not in email:
           return False, "Invalid email format. Please include '@' and '.' in your email."
       return True, email
   
   def get_user_info():
       while True:
           age = input("Enter your age: ")
           is_valid, result = validate_age(age)
           if is_valid:
               age = result
               break
           print(result)
   
       while True:
           email = input("Enter your email: ")
           is_valid, result = validate_email(email)
           if is_valid:
               email = result
               break
           print(result)
   
       print(f"Valid input received. Age: {age}, Email: {email}")
   
   if __name__ == "__main__":
       get_user_info()
   ```

   The script provides a user-friendly interface that guides the user to input correct information by providing specific error messages when the input is invalid. This approach improves the user experience and helps ensure that the program receives valid data to work with.

2. **Example: Database Connection Error Message (Python with SQLAlchemy)**

   - **Description**: Test a function that attempts to connect to a database and returns an error message if the connection fails.
   - **Sample prompt**: ```Write a python script that demonstrates connecting to a database, returning an error message if the connection fails.```
   - **Test Code (Python with SQLite)**:

   ```python
   import sqlite3
   
   def connect_to_database(db_name):
       try:
           # Attempt to establish a connection to the database
           conn = sqlite3.connect(db_name)
           print(f"Successfully connected to {db_name}")
           return conn
       except sqlite3.Error as e:
           # If an error occurs, return the error message
           return f"Error connecting to database: {e}"
   
   # Example usage
   db_name = "example.db"
   result = connect_to_database(db_name)
   
   # Check if the result is a connection object or an error message
   if isinstance(result, sqlite3.Connection):
       # If it's a connection, close it
       result.close()
       print("Connection closed.")
   else:
       # If it's an error message, print it
       print(result)
   ```

   In this example, the `connect_to_database` function attempts to establish a connection to a database. If the connection fails, it catches the `OperationalError` and returns a user-friendly error message. The `error_handling_test_database_connection` function tests this behavior.

3. **Example: File Read Error Message (Python)**

   - **Description**: Test a function that reads the content of a file and returns an error message if the file cannot be read.
   - **Sample prompt**: 
   - **Test Code (Python)**:

   ```python
   def read_file(file_path):
       try:
           with open(file_path, 'r') as file:
               content = file.read()
           return content
       except FileNotFoundError as e:
           return "The file could not be found. Please check the file path and try again."
       except IOError as e:
           return "An error occurred while reading the file. Please try again later."

   def error_handling_test_file_read():
       return read_file('nonexistent_file.txt')
   ```

   In this example, the `read_file` function attempts to read the content of a file. If the file is not found or there's an IO error, it catches the appropriate exceptions and returns corresponding error messages. The `error_handling_test_file_read` function tests this behavior.

These examples demonstrate error messages for different error handling scenarios, including input validation, database connection, and file reading. The provided code illustrates how to communicate meaningful error messages to users or developers in case of errors.
