## Web Development Tests
Domain-specific tests in web development focus on evaluating specific functionalities or features of a web application. Here are three specific examples of domain-specific tests for web development, along with sample code or instructions:

1. **Example: User Registration and Login (Python with Flask and Selenium)**

   - **Description**: Automate testing of user registration and login functionality in a web application using Selenium.
   - **Sample prompt**: ```Write a script using Selenium that tests the user registration and login functionality of a website.```
   - **Test Code (Python with Flask and Selenium)**:

   ```python
   from selenium import webdriver
   from selenium.webdriver.common.keys import Keys
   import time
   
   # Replace these with the actual URLs of the registration and login pages
   registration_url = "https://example.com/register"
   login_url = "https://example.com/login"
   
   # Replace these with the actual form field identifiers
   username_field_id = "username"
   password_field_id = "password"
   confirm_password_field_id = "confirm_password"
   register_button_id = "register_button"
   login_button_id = "login_button"
   
   # Replace these with test credentials
   test_username = "test_user"
   test_password = "test_password"
   
   # Set up the WebDriver (in this example, using Chrome)
   driver = webdriver.Chrome()
   
   # Test user registration
   def test_user_registration():
       driver.get(registration_url)
   
       # Fill in the registration form
       driver.find_element_by_id(username_field_id).send_keys(test_username)
       driver.find_element_by_id(password_field_id).send_keys(test_password)
       driver.find_element_by_id(confirm_password_field_id).send_keys(test_password)
   
       # Submit the registration form
       driver.find_element_by_id(register_button_id).click()
   
       # Wait for registration to complete (add more sophisticated waiting mechanisms if needed)
       time.sleep(3)
   
       # Check if registration is successful (modify this based on your website's behavior)
       assert "Registration successful" in driver.page_source
   
   # Test user login
   def test_user_login():
       driver.get(login_url)
   
       # Fill in the login form
       driver.find_element_by_id(username_field_id).send_keys(test_username)
       driver.find_element_by_id(password_field_id).send_keys(test_password)
   
       # Submit the login form
       driver.find_element_by_id(login_button_id).click()
   
       # Wait for login to complete (add more sophisticated waiting mechanisms if needed)
       time.sleep(3)
   
       # Check if login is successful (modify this based on your website's behavior)
       assert "Welcome, " + test_username in driver.page_source
   
   # Execute the tests
   try:
       test_user_registration()
       test_user_login()
       print("All tests passed!")
   except AssertionError as e:
       print(f"Test failed: {e}")
   
   # Close the browser window
   driver.quit()
   ```

   In this example, the test uses Selenium, a browser automation tool, to automate the process of registering a user and logging in. It interacts with the web page elements using element IDs. Make sure to adapt the script to fit the structure and behavior of the specific website you are testing. Additionally, consider using more robust waiting mechanisms (e.g., WebDriverWait) to ensure that the page elements are present before interacting with them.

2. **Example: Testing RESTful API Endpoints (Python with Flask)**

   - **Description**: Automate testing of RESTful API endpoints to ensure they return the expected responses.
   - **Sample prompt**: ```Write a python script to automate testing of a RESTful API. Also write the API script that would be tested.```
   - **Test Code (Python)**:
 
   ```python
   #Automated testing script
   import requests
   import json
   
   # Define API base URL
   base_url = "https://api.example.com"
   
   # Define test function with endpoint and expected behavior
   def test_api(endpoint, method, expected_status_code, expected_data=None):
     # Build the complete URL
     url = f"{base_url}/{endpoint}"
   
     # Send the request
     response = requests.request(method, url)
   
     # Validate status code
     assert response.status_code == expected_status_code, f"Unexpected status code: {response.status_code}"
   
     # Validate response data (if provided)
     if expected_data:
       response_data = response.json()
       assert response_data == expected_data, f"Unexpected response data: {response_data}"
   
   # Example test cases
   test_api("/users", "GET", 200)  # Test GET for users endpoint
   
   # Example with expected data
   user_data = {"name": "John Doe", "email": "john.doe@example.com"}
   test_api("/users/1", "GET", 200, user_data)  # Test GET for specific user with expected data
   
   # Run the tests
   print("Tests completed!")
   ```
   - **Sample prompt**: ```Write the API script that the above code would test.```
   - **Test Code (Python)**:
   ```python (with Flask)
   # API script to test
   from flask import Flask, jsonify, request
   
   app = Flask(__name__)
   
   # Sample user data (replace with your actual data storage)
   users = [
       {"id": 1, "name": "John Doe", "email": "john.doe@example.com"},
   ]
   
   @app.route("/users", methods=["GET"])
   def get_users():
     """Returns a list of all users"""
     return jsonify(users)
   
   @app.route("/users/<int:user_id>", methods=["GET"])
   def get_user(user_id):
     """Returns a specific user based on ID"""
     user = [u for u in users if u["id"] == user_id]
     if not user:
       return jsonify({"error": "User not found"}), 404
     return jsonify(user[0])
   
   if __name__ == "__main__":
     app.run(debug=True)
   ```



3. **Example: Testing Form Submission (JavaScript with Jest)**

   - **Description**: Automate testing of form submission in a web application using Jest, a JavaScript testing framework.
   - **Sample prompt**: ```Write a python script to automate testing of a RESTful API.```
   - **Test Code (JavaScript with Jest)**:

   ```javascript
   // Assuming a web page with a form and submit button

   test('Form Submission Test', async () => {
     const form = document.querySelector('form');
     const input = form.querySelector('input');
     const button = form.querySelector('button');

     input.value = 'test_input';
     const submitEvent = new Event('submit');
     form.dispatchEvent(submitEvent);

     // Assuming the form submission triggers an API call or some action
     await new Promise(resolve => setTimeout(resolve, 1000));

     // Check if the form submission was successful (e.g., UI update)
     expect(/* Check UI for expected change */).toBeTruthy();
   });
   ```

   In this example, a Jest test checks if form submission triggers the expected action, such as an API call or UI update.

These examples showcase domain-specific tests for web development, including user registration/login, testing API endpoints, and form submission. The provided code demonstrates how to automate these tests using various tools and frameworks.
