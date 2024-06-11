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

2. **Example: Testing RESTful API Endpoints (Python)**

   - **Description**: Automate testing of RESTful API endpoints to ensure they return the expected responses.
   - **Sample prompt**: ```Write a working python script to demonstrate automated testing of a RESTful API. Use a working public API for the demonstration.```
   - **Test Code (Python)**:
 
   ```python
   import unittest
   import requests
   
   class TestJSONPlaceholderAPI(unittest.TestCase):
       BASE_URL = "https://jsonplaceholder.typicode.com"
   
       def test_get_posts(self):
           # Test the /posts endpoint
           response = requests.get(f"{self.BASE_URL}/posts")
           self.assertEqual(response.status_code, 200)
           self.assertIsInstance(response.json(), list)
           self.assertGreater(len(response.json()), 0)
           print("GET /posts passed")
   
       def test_get_post_by_id(self):
           # Test the /posts/1 endpoint
           response = requests.get(f"{self.BASE_URL}/posts/1")
           self.assertEqual(response.status_code, 200)
           self.assertIsInstance(response.json(), dict)
           self.assertEqual(response.json()['id'], 1)
           print("GET /posts/1 passed")
   
       def test_create_post(self):
           # Test the POST /posts endpoint
           new_post = {
               "title": "foo",
               "body": "bar",
               "userId": 1
           }
           response = requests.post(f"{self.BASE_URL}/posts", json=new_post)
           self.assertEqual(response.status_code, 201)
           response_json = response.json()
           self.assertIsInstance(response_json, dict)
           self.assertEqual(response_json['title'], new_post['title'])
           self.assertEqual(response_json['body'], new_post['body'])
           self.assertEqual(response_json['userId'], new_post['userId'])
           print("POST /posts passed")
   
       def test_update_post(self):
           # Test the PUT /posts/1 endpoint
           updated_post = {
               "id": 1,
               "title": "foo",
               "body": "bar",
               "userId": 1
           }
           response = requests.put(f"{self.BASE_URL}/posts/1", json=updated_post)
           self.assertEqual(response.status_code, 200)
           response_json = response.json()
           self.assertIsInstance(response_json, dict)
           self.assertEqual(response_json['title'], updated_post['title'])
           self.assertEqual(response_json['body'], updated_post['body'])
           self.assertEqual(response_json['userId'], updated_post['userId'])
           print("PUT /posts/1 passed")
   
       def test_delete_post(self):
           # Test the DELETE /posts/1 endpoint
           response = requests.delete(f"{self.BASE_URL}/posts/1")
           self.assertEqual(response.status_code, 200)
           print("DELETE /posts/1 passed")
   
   if __name__ == "__main__":
       unittest.main()
   ```
   This script provides a basic structure for automated API testing using unittest and requests. You can extend it by adding more tests for different endpoints and scenarios.This script provides a basic structure for automated API testing using unittest and requests. You can extend it by adding more tests for different endpoints and scenarios.

These examples showcase domain-specific tests for web development, including user registration/login, testing API endpoints, and form submission. The provided code demonstrates how to automate these tests using various tools and frameworks.
