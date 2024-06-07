## Load Handling
Load handling tests are crucial for evaluating how a system performs under a significant load of concurrent users or requests. Here are three specific examples of load handling tests, along with sample code or instructions:

1. **Example: Load Testing a Web Application**

   - **Description**: Test a web application by simulating a large number of concurrent users making HTTP requests.
   - **Sample Prompt**: ```Write a dummy web application and an application to demonstrate load testing of the dummy web app. Have both run in Jupyter Notebook.```
   - **Test Code (Jupyter Notebook)**:

   ```python
   ### Cell 1 ###
   # Install Flask
   !pip install flask
   
   ### Cell 2 ###
   # Save the Flask application to a file
   flask_app_content = """
   from flask import Flask
   import os
   
   app = Flask(__name__)
   
   @app.route('/')
   def home():
       return "Welcome to the home page!"
   
   @app.route('/about')
   def about():
       return "This is the about page."
   
   @app.route('/contact')
   def contact():
       return "This is the contact page."
   
   @app.route('/pid' )
   def pid():
       return "app.py PID = "+str(os.getpid())
   
   if __name__ == '__main__':
       with open('app_PID.txt', 'w') as f:
           f.write(str(os.getpid()))
       app.run(host='0.0.0.0', port=5000)
   """
   
   with open('app.py', 'w') as f:
       f.write(flask_app_content)
   
   print("Flask app has been created.")
   
   ### Cell 3 ###
   # Install Locust
   !pip install locust
   
   # Create a locustfile.py for load testing
   locustfile_content = """
   from locust import HttpUser, task, between
   
   class MyWebAppUser(HttpUser):
       wait_time = between(1, 5)
   
       @task
       def load_main_page(self):
           self.client.get("/")
           
       @task
       def load_about_page(self):
           self.client.get("/about")
   
       @task
       def load_contact_page(self):
           self.client.get("/contact")
   """
   
   # Write the locustfile content to a file
   with open('locustfile.py', 'w') as f:
       f.write(locustfile_content)
   
   print("locustfile.py has been created.")
   
   ### Cell 4 ###
   import multiprocessing
   import time
   import os
   import signal
   
   # Function to run the Flask app
   def run_flask_app():
       print(f"Running Flask app on PID {os.getpid()}")
       os.system('python app.py')
   
   # Start the Flask app in a separate process
   flask_process = multiprocessing.Process(target=run_flask_app)
   flask_process.start()
   
   # Give the Flask app a few seconds to start
   time.sleep(5)
   
   # Run the Locust load test
   !locust -f locustfile.py --headless -u 100 -r 10 -t 1m --host http://0.0.0.0:5000
   
   # Terminate the Flask app after the load test
   flask_process.terminate()
   flask_process.join()
   !kill -9 $(cat app_PID.txt)
   print("Flask app has been terminated.")
   ```

   This setup will run a simple Flask web application on Google Colab and perform load testing on it using Locust.

2. **Example: Load Testing an API**

   - **Description**: Test an API by simulating a large number of concurrent requests.
   - **Sample Prompt**: ```Write a working demonstration in python of load balance testing of an API.```
   - **Test Code (Python)**:
   ```python
   # Load Balance Testing of an API
   
   import requests
   import concurrent.futures
   import time
   import random
   import matplotlib.pyplot as plt
   
   # Define the API endpoint (using httpbin.org for testing)
   API_URL = "http://httpbin.org/get"
   
   # List of servers (for demonstration purposes, we will simulate different instances)
   servers = [
       "http://httpbin.org/get?server=1",
       "http://httpbin.org/get?server=2",
       "http://httpbin.org/get?server=3",
   ]
   
   def send_request(server_url):
       """Send a request to the given server URL and return the response time."""
       start_time = time.time()
       response = requests.get(server_url)
       response_time = time.time() - start_time
       return server_url, response.status_code, response_time
   
   def test_load_balancing(api_url, servers, num_requests=100):
       """Test load balancing by sending multiple requests to the API endpoint."""
       results = []
       with concurrent.futures.ThreadPoolExecutor() as executor:
           # Distribute requests randomly across the servers
           future_to_request = {
               executor.submit(send_request, random.choice(servers)): i
               for i in range(num_requests)
           }
           for future in concurrent.futures.as_completed(future_to_request):
               server_url, status_code, response_time = future.result()
               results.append((server_url, status_code, response_time))
       return results
   
   # Perform the load balancing test
   num_requests = 100
   results = test_load_balancing(API_URL, servers, num_requests)
   
   # Analyze the results
   server_response_times = {server: [] for server in servers}
   
   for server_url, status_code, response_time in results:
       if status_code == 200:
           server_response_times[server_url].append(response_time)
   
   # Print the results
   for server, times in server_response_times.items():
       print(f"Server: {server}")
       print(f"Number of Requests: {len(times)}")
       if times:
           print(f"Average Response Time: {sum(times)/len(times):.4f} seconds")
       print()
   
   # Plotting the results
   plt.figure(figsize=(12, 6))
   for server, times in server_response_times.items():
       plt.plot(times, label=server.split('?')[1])  # Label with server number
   
   plt.title('API Load Balance Testing')
   plt.xlabel('Request Number')
   plt.ylabel('Response Time (s)')
   plt.legend()
   plt.show()
   ```

   This script provides a working example of load balance testing of an API, and you can modify it as needed for your specific use case.

3. **Example: Load Testing a Database (Python with SQLAlchemy and Locust)**

   - **Description**: Test a database by simulating a large number of concurrent queries.
   - **Sample Prompt**: ```Write a working python script that demonstrates load testing a database with a large number of concurrent connections. ```
   - **Test Code (Jupyter Notebook)**:
   ```python
   ### Cell 1 ###
   # Write setup_db.py
   
   SETUP_DB="""
   import sqlite3
   
   # Database file
   DB_FILE = 'test_db.sqlite'
   
   def create_test_db():
       # Create a test SQLite database and insert sample data.
       conn = sqlite3.connect(DB_FILE)
       cursor = conn.cursor()
   
       # Create a table
       cursor.execute('''
       CREATE TABLE IF NOT EXISTS test_table (
           id INTEGER PRIMARY KEY AUTOINCREMENT,
           name TEXT NOT NULL,
           value INTEGER NOT NULL
       )
       ''')
   
       # Insert sample data
       cursor.executemany('''
       INSERT INTO test_table (name, value) VALUES (?, ?)
       ''', [(f'Name{i}', i) for i in range(100)])
   
       conn.commit()
       conn.close()
   
   if __name__ == "__main__":
       create_test_db()
       print("Test database created and populated with sample data.")
   """
   with open('setup_db.py', 'w') as f:
       f.write(SETUP_DB)
   
   ### Cell 2 ###
   # Write load_test_db.py
   
   LOAD_TEST_DB="""
   import sqlite3
   import concurrent.futures
   import time
   
   # Database file
   DB_FILE = 'test_db.sqlite'
   
   def execute_query():
       # Fetch data from the SQLite database to simulate load.
       conn = sqlite3.connect(DB_FILE)
       try:
           cursor = conn.cursor()
           cursor.execute("SELECT name, value FROM test_table WHERE id = ?", (1,))
           result = cursor.fetchone()
           return result
       except Exception as e:
           print(f"Error executing query: {e}")
       finally:
           conn.close()
   
   def load_test_db(num_requests=100):
       # Perform load testing by executing multiple queries concurrently.
       results = []
       with concurrent.futures.ThreadPoolExecutor(max_workers=50) as executor:
           future_to_query = {
               executor.submit(execute_query): i for i in range(num_requests)
           }
           for future in concurrent.futures.as_completed(future_to_query):
               try:
                   result = future.result()
                   results.append(result)
               except Exception as e:
                   print(f"Query resulted in an error: {e}")
       return results
   
   if __name__ == "__main__":
       start_time = time.time()
       num_requests = 100000
       results = load_test_db(num_requests)
       end_time = time.time()
       elapsed_time = end_time - start_time
   
       print(f"Executed {num_requests} queries in {elapsed_time:.2f} seconds.")
       print(f"Average time per query: {elapsed_time / num_requests:.4f} seconds.")
   """
   with open('load_test_db.py', 'w') as f:
       f.write(LOAD_TEST_DB)
       
   ### Cell 3 ###
   !python setup_db.py
   !python load_test_db.py
   ```

   In this example, the `DbUser` class simulates users making database queries. It uses SQLAlchemy to connect to a database and execute a select query.

   To run the test, execute `locust -f locustfile.py` in the terminal.

These examples demonstrate how to perform load handling tests using Locust, simulating concurrent users or requests for web applications, APIs, and databases. The provided code can be used as a starting point and customized based on specific requirements.
