## Access control
Access control is a crucial aspect of security, ensuring that only authorized users or systems have access to certain resources. Here are three specific examples of access control for security tests, along with sample code or instructions:

1. **Example: Role-Based Access Control (RBAC) in a Web Application**

   - **Description**: Test a web application to ensure that access to certain routes or functionalities is restricted based on user roles.
   - **Sample Prompt**: ```Write a working demonstration of testing a web application to ensure that access to certain routes or functionalities are restricted based on user roles.```
   - **Test Code (Python with Flask and PyTest)**: Ensure PyTest and Flask are installed. (```pip install pytest flask-testing```)
     - **app.py**
      ```python
      from flask import Flask, jsonify, request, abort
      from functools import wraps
      
      app = Flask(__name__)
      
      # In-memory user store
      users = {
          "admin": {"password": "adminpass", "role": "admin"},
          "user": {"password": "userpass", "role": "user"}
      }
      
      # Dummy login function to simulate user login
      def login(username, password):
          user = users.get(username)
          if user and user["password"] == password:
              return {"username": username, "role": user["role"]}
          return None
      
      # Role-based access control decorator
      def role_required(role):
          def decorator(f):
              @wraps(f)
              def decorated_function(*args, **kwargs):
                  auth = request.authorization
                  if not auth or not login(auth.username, auth.password):
                      return abort(401)
                  user = login(auth.username, auth.password)
                  if user["role"] != role:
                      return abort(403)
                  return f(*args, **kwargs)
              return decorated_function
          return decorator
      
      @app.route('/admin')
      @role_required('admin')
      def admin_route():
          return jsonify({"message": "Welcome, admin!"})
      
      @app.route('/user')
      @role_required('user')
      def user_route():
          return jsonify({"message": "Welcome, user!"})
      
      @app.route('/public')
      def public_route():
          return jsonify({"message": "Welcome, guest!"})
      
      if __name__ == '__main__':
          app.run()
      ```
      - **test_app.py**
      ```python
      import pytest
      from flask import Flask
      from app import app
      
      @pytest.fixture
      def client():
          app.config['TESTING'] = True
          with app.test_client() as client:
              yield client
      
      def test_public_route(client):
          response = client.get('/public')
          assert response.status_code == 200
          assert response.get_json() == {"message": "Welcome, guest!"}
      
      def test_user_route_with_user_role(client):
          response = client.get('/user', headers={'Authorization': 'Basic dXNlcjp1c2VycGFzcw=='}) # user:userpass
          assert response.status_code == 200
          assert response.get_json() == {"message": "Welcome, user!"}
      
      def test_user_route_with_admin_role(client):
          response = client.get('/user', headers={'Authorization': 'Basic YWRtaW46YWRtaW5wYXNz'}) # admin:adminpass
          assert response.status_code == 403
      
      def test_admin_route_with_admin_role(client):
          response = client.get('/admin', headers={'Authorization': 'Basic YWRtaW46YWRtaW5wYXNz'}) # admin:adminpass
          assert response.status_code == 200
          assert response.get_json() == {"message": "Welcome, admin!"}
      
      def test_admin_route_with_user_role(client):
          response = client.get('/admin', headers={'Authorization': 'Basic dXNlcjp1c2VycGFzcw=='}) # user:userpass
          assert response.status_code == 403
      
      def test_admin_route_without_auth(client):
          response = client.get('/admin')
          assert response.status_code == 401
      
      def test_user_route_without_auth(client):
          response = client.get('/user')
          assert response.status_code == 401
      ```
   To run the tests:
   - Start the web app with ```python app.py```
   - Run ```pytest test_app.py```

   This setup provides a solid foundation for testing role-based access control in a Flask web application..

2. **Example: API Access Control (Python with Flask)**

   - **Description**: Test an API to ensure that only authenticated users with the correct API key have access to certain endpoints.
   - **Sample Prompt**: ```Write a working demonstration of how only authenticated users with the correct API key can have access to certain endpoints.```
   - **Test Code (Python with Flask)**:

   ```python
   from flask import Flask, request, jsonify
   
   app = Flask(__name__)
   
   # This is a hardcoded example of an API key. In a real application,
   # you would store these securely, such as in an environment variable
   # or a database.
   API_KEYS = {
       "123456": "user1",
       "abcdef": "user2"
   }
   
   def check_api_key(api_key):
       return API_KEYS.get(api_key)
   
   @app.route('/public')
   def public_endpoint():
       return jsonify(message="This is a public endpoint, no API key required.")
   
   @app.route('/private')
   def private_endpoint():
       api_key = request.headers.get('X-API-KEY')
       if not api_key:
           return jsonify(message="API key is missing."), 401
       
       user = check_api_key(api_key)
       if not user:
           return jsonify(message="Invalid API key."), 403
       
       return jsonify(message=f"This is a private endpoint. Welcome {user}!")
   
   if __name__ == '__main__':
       app.run(debug=True)
   ```

   To test the code,
   - Start the application:
     ```python app.py```
   - Run the following commands to test access:
     - ```curl http://localhost:5000/public```  
       Response:
       ```
       {
         "message": "This is a public endpoint, no API key required."
       }
       ```
     - ```curl http://localhost:5000/private```  
       Response:
       ```
       {
         "message": "API key is missing."
       }
       ```
     - ```curl -H "X-API-KEY: wrongkey" http://127.0.0.1:5000/private```  
       Response:
       ```
       {
         "message": "Invalid API key."
       }
       ```
     - ```curl -H "X-API-KEY: 123456" http://127.0.0.1:5000/private```  
       Response:
       ```
       {
         "message": "This is a private endpoint. Welcome user1!"
       }
       ```

   **Explanaion**
   - **API Keys**: The API_KEYS dictionary contains the valid API keys and their corresponding users. In a real application, these keys should be stored securely.
   - **Checking API Key**: The check_api_key function checks if the provided API key exists in the API_KEYS dictionary.
   - **Public Endpoint**: The /public endpoint is accessible to anyone without an API key.
   - **Private Endpoint**: The /private endpoint requires an API key. If the API key is missing or invalid, the server returns a 401 or 403 status code respectively. If the API key is valid, the endpoint returns a welcome message including the user's name.

This is a basic demonstration. In a production environment, you should consider additional security measures, such as storing API keys securely, using HTTPS, and implementing rate limiting.

3. **Example: File System Access Control (Python)**

   - **Description**: Test a script to ensure that only authorized users have access to certain files or directories.
   - **Sample Prompt**: ```Write a python script to test that only authorized users have access to certain files or directories.```
   - **Test Code (Python)**:

   ```python
   import os
   import stat
   import pwd
   import grp
   
   def get_user_info(username):
       try:
           user_info = pwd.getpwnam(username)
           return user_info.pw_uid, user_info.pw_gid
       except KeyError:
           raise ValueError(f"User '{username}' not found.")
   
   def check_permissions(path, username):
       if not os.path.exists(path):
           raise FileNotFoundError(f"Path '{path}' does not exist.")
   
       file_stat = os.stat(path)
       file_mode = file_stat.st_mode
   
       uid, gid = get_user_info(username)
       file_uid = file_stat.st_uid
       file_gid = file_stat.st_gid
   
       # Check owner permissions
       if file_uid == uid:
           owner_perms = (file_mode & stat.S_IRWXU) >> 6
           if owner_perms & stat.S_IRUSR:
               return True
   
       # Check group permissions
       if file_gid == gid:
           group_perms = (file_mode & stat.S_IRWXG) >> 3
           if group_perms & stat.S_IRGRP:
               return True
   
       # Check others permissions
       others_perms = file_mode & stat.S_IRWXO
       if others_perms & stat.S_IROTH:
           return True
   
       return False
   
   def main():
       # Example usage
       path = "/content/sample_data"
       username = "nobody"
   
       if check_permissions(path, username):
           print(f"User '{username}' has access to '{path}'.")
       else:
           print(f"User '{username}' does not have access to '{path}'.")
   
   if __name__ == "__main__":
       main()
   ```

   In this script:
   - _get_user_info(username)_: Retrieves the user ID and group ID of the given username.
   - _check_permissions(path, username)_: Checks if the user has read access to the specified path by evaluating the file's owner, group, and others permissions.
   - _main()_: Demonstrates how to use the check_permissions function.
   
   Replace "/content/sample_data" with the actual path you want to check and "nobody" with the username you want to test.

   This script only checks read access, but you can modify it to check for write or execute permissions by changing the relevant stat constants (stat.S_IWUSR, stat.S_IXUSR, etc.).
   
These examples demonstrate access control techniques to enhance security, including role-based access control in a web application, API key authentication, and file system access control. The provided code illustrates how to implement these access control measures.

