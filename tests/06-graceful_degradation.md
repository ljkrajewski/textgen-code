## Graceful Degradation
Graceful degradation is a design principle that ensures a system can continue to function, albeit with reduced capabilities, in the event of an error or failure. Here are three specific examples of tests for graceful degradation in error handling, along with sample code or instructions:

1. **Example: Web Application with External Service Dependency**

   - **Description**: Test a web application that depends on an external service. Verify that the application continues to function with reduced functionality if the external service is unavailable.
   - **Sample Prompt**: ```Write a python script to demonstrate "graceful degradation," that the script continues to function even when an external function is unavailable. Have the external function be a call to an external API call that will actually run.```
   - **Test Code (Python with Flask)**:

   ```python
   import requests
   import json
   
   def get_user_data_from_api(user_id):
       # Attempt to fetch user data from an external API.
       url = f"https://jsonplaceholder.typicode.com/users/{user_id}"
       try:
           response = requests.get(url, timeout=5)
           response.raise_for_status()
           return response.json()
       except (requests.RequestException, json.JSONDecodeError) as e:
           print(f"Error fetching data from API: {e}")
           return None
   
   def get_fallback_user_data(user_id):
       # Provide fallback user data when the API is unavailable.
       fallback_data = {
           1: {"name": "John Doe", "email": "john@example.com"},
           2: {"name": "Jane Smith", "email": "jane@example.com"},
       }
       return fallback_data.get(user_id, {"name": "Unknown", "email": "unknown@example.com"})
   
   def get_user_data(user_id):
       # Get user data with graceful degradation.
       api_data = get_user_data_from_api(user_id)
       if api_data:
           print("Data retrieved from API")
           return api_data
       else:
           print("Using fallback data")
           return get_fallback_user_data(user_id)
   
   def main():
       user_id = 13
       user_data = get_user_data(user_id)
       print(f"User data for user {user_id}:")
       print(f"Name: {user_data.get('name')}")
       print(f"Email: {user_data.get('email')}")
   
   if __name__ == "__main__":
       main()
   ```

   In this example, the function `graceful_degradation_test_external_service` attempts to fetch weather information from an external service. If the service is unavailable, it gracefully handles the error by providing a user-friendly message.

2. **Example: Database Connection**

   - **Description**: Test a web application that relies on a database connection. Verify that the application can handle database connection failures and provide an appropriate response.
   - **Sample Prompt**: ```Write a python script to demonstrate "graceful degradation," that the script that relies on a database connection can handle database connection failures and provide an appropriate response. For the demonstration, use python and sqlite.```
   - **Test Code (Python with SQLite)**:

   ```python
   import sqlite3
   import time
   
   def create_table(conn):
       cursor = conn.cursor()
       cursor.execute('''
           CREATE TABLE IF NOT EXISTS users (
               id INTEGER PRIMARY KEY,
               name TEXT NOT NULL,
               email TEXT UNIQUE NOT NULL
           )
       ''')
       conn.commit()
   
   def insert_user(conn, name, email):
       cursor = conn.cursor()
       cursor.execute('INSERT INTO users (name, email) VALUES (?, ?)', (name, email))
       conn.commit()
   
   def get_all_users(conn):
       cursor = conn.cursor()
       cursor.execute('SELECT * FROM users')
       return cursor.fetchall()
   
   def connect_to_database(max_retries=3, retry_delay=2):
       retries = 0
       while retries < max_retries:
           try:
               conn = sqlite3.connect('example.db')
               print("Successfully connected to the database.")
               return conn
           except sqlite3.Error as e:
               print(f"Database connection failed: {e}")
               retries += 1
               if retries < max_retries:
                   print(f"Retrying in {retry_delay} seconds...")
                   time.sleep(retry_delay)
               else:
                   print("Max retries reached. Unable to connect to the database.")
                   return None
   
   def main():
       conn = connect_to_database()
       
       if conn is not None:
           try:
               create_table(conn)
               insert_user(conn, "Alice", "alice@example.com")
               insert_user(conn, "Bob", "bob@example.com")
               
               users = get_all_users(conn)
               print("Users in the database:")
               for user in users:
                   print(user)
           except sqlite3.Error as e:
               print(f"An error occurred while performing database operations: {e}")
           finally:
               conn.close()
               print("Database connection closed.")
       else:
           print("Falling back to alternative behavior or error handling.")
           # Here you could implement alternative behavior, such as:
           # - Using a local cache
           # - Providing limited functionality
           # - Displaying a user-friendly error message
   
   if __name__ == "__main__":
       main()
   ```

   This script provides a foundation for graceful degradation. In a production environment, you might want to add more robust logging, more sophisticated retry mechanisms, or implement specific fallback behaviors based on your application's needs.

3. **Example: File Read/Write Operation (Python)**

   - **Description**: Test a file operation in an application. Verify that the application can handle file-related errors and provide a suitable response.
   - **Sample Prompt**: 
   - **Test Code (Python)**:

   ```python
   import os
   
   def read_and_process_file(filename):
       try:
           # Attempt to open and read the file
           with open(filename, 'r') as file:
               content = file.read()
           
           # Process the content (in this case, just count words)
           word_count = len(content.split())
           
           print(f"Successfully read the file. Word count: {word_count}")
           return word_count
       
       except FileNotFoundError:
           print(f"Error: The file '{filename}' was not found.")
           return None
       
       except PermissionError:
           print(f"Error: You don't have permission to read '{filename}'.")
           return None
       
       except IOError as e:
           print(f"An I/O error occurred: {str(e)}")
           return None
       
       except Exception as e:
           print(f"An unexpected error occurred: {str(e)}")
           return None
   
   def main():
       filename = input("Enter the filename to read: ")
       
       result = read_and_process_file(filename)
       
       if result is not None:
           print("File processing completed successfully.")
       else:
           print("File processing failed. The program will continue with reduced functionality.")
           
       # The program continues with other operations...
       print("Continuing with other operations...")
   
   if __name__ == "__main__":
       main()
   ```

   This approach allows the program to handle errors gracefully and continue operating, even if not at full capacity, rather than crashing or terminating unexpectedly.

These examples demonstrate tests for graceful degradation in error handling, where applications are designed to handle potential failures and provide informative messages to users. The provided code illustrates how to implement this principle in different scenarios.
