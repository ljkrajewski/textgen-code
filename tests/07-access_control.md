Access control is a crucial aspect of security, ensuring that only authorized users or systems have access to certain resources. Here are three specific examples of access control for security tests, along with sample code or instructions:

1. **Example: Role-Based Access Control (RBAC) in a Web Application (Python with Flask)**

   - **Description**: Test a web application to ensure that access to certain routes or functionalities is restricted based on user roles.

   - **Test Code (Python with Flask)**:

   ```python
   from flask import Flask, request, abort

   app = Flask(__name__)

   def check_user_role(username, required_role):
       # Assuming user roles are stored in a database or another data source
       user_roles = {'admin': 'admin', 'user1': 'user', 'user2': 'user'} 

       if username in user_roles and user_roles[username] == required_role:
           return True
       else:
           abort(403)  # Access forbidden

   @app.route('/admin_dashboard')
   def admin_dashboard():
       username = request.args.get('username')
       if check_user_role(username, 'admin'):
           return f"Welcome to the admin dashboard, {username}!"
   
   @app.route('/user_dashboard')
   def user_dashboard():
       username = request.args.get('username')
       if check_user_role(username, 'user'):
           return f"Welcome to the user dashboard, {username}!"

   if __name__ == '__main__':
       app.run()
   ```

   In this example, the `check_user_role` function verifies if a user has the required role to access a specific route. If not, it aborts the request with a 403 Forbidden error. The routes `/admin_dashboard` and `/user_dashboard` demonstrate access control based on user roles.

2. **Example: API Access Control (Python with Flask)**

   - **Description**: Test an API to ensure that only authenticated users with the correct API key have access to certain endpoints.

   - **Test Code (Python with Flask)**:

   ```python
   from flask import Flask, request, abort

   app = Flask(__name__)

   API_KEY = 'my_secret_api_key'

   def authenticate_api_key(api_key):
       if api_key == API_KEY:
           return True
       else:
           abort(401)  # Unauthorized access

   @app.route('/protected_endpoint')
   def protected_endpoint():
       api_key = request.headers.get('Authorization')

       if authenticate_api_key(api_key):
           return "Access granted!"
   
   if __name__ == '__main__':
       app.run()
   ```

   In this example, the `authenticate_api_key` function verifies if the provided API key matches the expected key. If not, it aborts the request with a 401 Unauthorized error. The `/protected_endpoint` route demonstrates access control based on API key authentication.

3. **Example: File System Access Control (Python)**

   - **Description**: Test a script to ensure that only authorized users have access to certain files or directories.

   - **Test Code (Python)**:

   ```python
   import os

   def read_sensitive_file(file_path, user):
       # Assuming user permissions are stored in a database or another data source
       user_permissions = {'admin': ['/etc/passwd'], 'user1': ['/etc/hosts']} 

       if user in user_permissions and file_path in user_permissions[user]:
           with open(file_path, 'r') as file:
               content = file.read()
           return content
       else:
           return "Access denied"

   result = read_sensitive_file('/etc/passwd', 'admin')
   print(result)
   ```

   In this example, the `read_sensitive_file` function checks if a user has permission to read a specific file. If not, it returns an "Access denied" message.

These examples demonstrate access control techniques to enhance security, including role-based access control in a web application, API key authentication, and file system access control. The provided code illustrates how to implement these access control measures.
