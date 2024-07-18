## Graceful Degradation
Graceful degradation is a design principle that ensures a system can continue to function, albeit with reduced capabilities, in the event of an error or failure. Here are three specific examples of tests for graceful degradation in error handling, along with sample code or instructions:

1. **Example: Web Application with External Service Dependency (Python with Flask)**

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

2. **Example: Database Connection (Python with SQLAlchemy)**

   - **Description**: Test a web application that relies on a database connection. Verify that the application can handle database connection failures and provide an appropriate response.
   - **Sample Prompt**: 
   - **Test Code (Python with SQLAlchemy)**:

   ```python
   from sqlalchemy import create_engine
   from sqlalchemy.exc import OperationalError

   def graceful_degradation_test_database_connection():
       try:
           engine = create_engine('postgresql://username:password@localhost:5432/database')
           connection = engine.connect()
           result = connection.execute('SELECT * FROM table_name')
           return result.fetchall()
       except OperationalError as e:
           # Handle the case where the database connection fails
           return "Unable to connect to the database. Please try again later."
   ```

   In this example, the function `graceful_degradation_test_database_connection` attempts to connect to a database and execute a query. If the database connection fails, it gracefully handles the error by providing a user-friendly message.

3. **Example: File Read/Write Operation (Python)**

   - **Description**: Test a file operation in an application. Verify that the application can handle file-related errors and provide a suitable response.
   - **Sample Prompt**: 
   - **Test Code (Python)**:

   ```python
   def graceful_degradation_test_file_operation():
       try:
           with open('example.txt', 'r') as file:
               content = file.read()
           return f"Content of the file: {content}"
       except FileNotFoundError as e:
           # Handle the case where the file is not found
           return "The file could not be found. Please try again later."
       except IOError as e:
           # Handle general input/output errors
           return "An error occurred while reading the file. Please try again later."
   ```

   In this example, the function `graceful_degradation_test_file_operation` attempts to read the content of a file. If the file is not found or there's an IO error, it gracefully handles the error by providing a user-friendly message.

These examples demonstrate tests for graceful degradation in error handling, where applications are designed to handle potential failures and provide informative messages to users. The provided code illustrates how to implement this principle in different scenarios.
