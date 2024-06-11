## Web Development Tests
Domain-specific tests in web development focus on evaluating specific functionalities or features of a web application. Here are three specific examples of domain-specific tests for web development, along with sample code or instructions:

1. **Example: User Registration and Login (Python with Flask and Selenium)**

   - **Description**: Automate testing of user registration and login functionality in a web application using Selenium.
   - **Sample prompt**: ```I need a demonstration of automated testing of a web site's registration and login functionality. Please write (1) a python script to simulate a web site registration and login pages, and (2) a script to test the simulated site's registration and login pages. Both need to run within a Jupyter Notebook page.```
   - **Test Code (Jupyter Notebook)**:

   ```python
   ### Cell 1 ###
   %%shell
   sudo apt -y update
   sudo apt install -y wget curl unzip libvulkan1 
   wget http://archive.ubuntu.com/ubuntu/pool/main/libu/libu2f-host/libu2f-udev_1.1.4-1_all.deb
   dpkg -i libu2f-udev_1.1.4-1_all.deb
   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   dpkg -i google-chrome-stable_current_amd64.deb
   
   wget -N https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/118.0.5993.70/linux64/chromedriver-linux64.zip -P /tmp/
   unzip -o /tmp/chromedriver-linux64.zip -d /tmp/
   chmod +x /tmp/chromedriver-linux64/chromedriver
   mv /tmp/chromedriver-linux64/chromedriver /usr/local/bin/chromedriver
   pip install selenium chromedriver_autoinstaller webdriver-manager
   
   ### Cell 2 ###
   WEBSITE="""
   # Simulating a simple web site with Flask
   from flask import Flask, render_template, request, redirect, url_for
   from multiprocessing import Process
   
   app = Flask(__name__)
   users = {}
   
   @app.route('/')
   def home():
       return 'Welcome to the Home Page!'
   
   @app.route('/register', methods=['GET', 'POST'])
   def register():
       if request.method == 'POST':
           username = request.form['username']
           password = request.form['password']
           if username in users:
               return 'Username already exists!'
           users[username] = password
           return redirect(url_for('login'))
       return '''
           <form method="post">
               Username: <input type="text" name="username"><br>
               Password: <input type="password" name="password"><br>
               <input type="submit" value="Register">
           </form>
       '''
   
   @app.route('/login', methods=['GET', 'POST'])
   def login():
       if request.method == 'POST':
           username = request.form['username']
           password = request.form['password']
           if username not in users or users[username] != password:
               return 'Invalid credentials!'
           return 'Login successful!'
       return '''
           <form method="post">
               Username: <input type="text" name="username"><br>
               Password: <input type="password" name="password"><br>
               <input type="submit" value="Login">
           </form>
       '''
   
   def run_app():
       app.run(debug=False, port=5000, use_reloader=False)
   
   # Run Flask app in a separate process
   flask_process = Process(target=run_app)
   flask_process.start()
   """
   with open('app.py', 'w') as f:
       f.write(WEBSITE)
   
   ### Cell 3 ###
   TESTER="""
   # Automated testing with Selenium
   from selenium import webdriver
   from selenium.webdriver.common.by import By
   from selenium.webdriver.common.keys import Keys
   from selenium.webdriver.chrome.service import Service
   from selenium.webdriver.chrome.options import Options
   from webdriver_manager.chrome import ChromeDriverManager
   import time
   import chromedriver_autoinstaller
   
   import sys
   sys.path.insert(0,'/usr/lib/chromium-browser/chromedriver')
   
   # Set up Chrome options
   chrome_options = webdriver.ChromeOptions()
   chrome_options.add_argument('--headless') # this is must
   chrome_options.add_argument('--no-sandbox')
   chrome_options.add_argument('--disable-dev-shm-usage')
   chromedriver_autoinstaller.install()
   
   # Set up the WebDriver
   driver = webdriver.Chrome(options=chrome_options)
   
   # Define the URL of the web application
   url = 'http://127.0.0.1:5000'
   
   # Test user registration
   def test_user_registration():
     driver.get(f'{url}/register')
     time.sleep(1)
     username_input = driver.find_element(By.NAME, 'username')
     password_input = driver.find_element(By.NAME, 'password')
     username_input.send_keys('testuser')
     password_input.send_keys('password123')
     password_input.send_keys(Keys.RETURN)
     time.sleep(1)
   
     # Check if redirected to login page
     assert 'login' in driver.current_url
   
   # Test user login
   def test_user_login():
     driver.get(f'{url}/login')
     time.sleep(1)
     username_input = driver.find_element(By.NAME, 'username')
     password_input = driver.find_element(By.NAME, 'password')
     username_input.send_keys('testuser')
     password_input.send_keys('password123')
     password_input.send_keys(Keys.RETURN)
     time.sleep(1)
   
     # Check if login was successful
     assert 'Login successful!' in driver.page_source
   
   # Execute the tests
   try:
       test_user_registration()
       test_user_login()
       print("All tests passed!")
   except AssertionError as e:
       print(f"Test failed: "+str(e))
       print(str(type(e)))
   
   # Close the browser
   driver.quit()
   """
   with open('test_script.py', 'w') as f:
       f.write(TESTER)
       
   ### Cell 4 ###
   import multiprocessing
   import time
   import os
   
   # Function to run the Flask app
   def run_flask_app():
       print(f"Running Flask app on PID {os.getpid()}")
       os.system('python3 app.py')
   
   print("=== Starting web server ===")
   # Start the Flask app in a separate process
   flask_process = multiprocessing.Process(target=run_flask_app)
   flask_process.start()
   # Give the Flask app a few seconds to start
   time.sleep(10)
   print("=== Starting testing ===")
   !python3 test_script.py
   ```

   In this example, the test uses Selenium, a browser automation tool, to automate the process of registering a user and logging in. It interacts with the web page elements using element IDs. Make sure to adapt the script to fit the structure and behavior of the specific website you are testing. Additionally, consider using more robust waiting mechanisms (e.g., WebDriverWait) to ensure that the page elements are present before interacting with them.  
   _Note: The web app in this example will fail the tests because of errors in the registration section._

3. **Example: Testing RESTful API Endpoints (Python with Flask)**

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



4. **Example: Testing Form Submission (JavaScript with Jest)**

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
