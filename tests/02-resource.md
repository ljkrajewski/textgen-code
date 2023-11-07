## Resource Usage Tests for Performance
Resource usage tests are important for evaluating how efficiently a system utilizes resources like CPU, memory, and disk space. Here are three specific examples of resource usage tests, along with sample code or instructions:

1. **Example: CPU Usage Test (Python)**
   - **Description**: Measure the CPU usage of a specific function or process.
   - **Sample Prompt:** ```Write a python script to measure the CPU usage of a computationally intensive task.```
   - **Test Case**:
     - **Expected Output**: CPU usage percentage

   - **Test Code**:

   ```python
   import psutil
   import time
   
   # Define a computationally intensive task (in this case, calculating factorials)
   def factorial(n):
       if n == 0:
           return 1
       else:
           return n * factorial(n-1)
   
   # Get the initial CPU usage
   initial_cpu_usage = psutil.cpu_percent()
   
   # Start the task
   n = 500  # Adjust the complexity of the task as needed
   result = factorial(n)
   
   # Get the final CPU usage
   final_cpu_usage = psutil.cpu_percent()
   
   # Calculate the CPU usage during the task
   cpu_usage_during_task = final_cpu_usage - initial_cpu_usage
   
   # Print the results
   print(f"Result: {result}")
   print(f"Initial CPU Usage: {initial_cpu_usage}%")
   print(f"Final CPU Usage: {final_cpu_usage}%")
   print(f"CPU Usage During Task: {cpu_usage_during_task}%")
   ```
   This code uses the `psutil` library in Python to measure CPU usage. Be sure to install the `psutil` library before attempting to run (```pip install psutil```).

2. **Example: Memory Usage Test (Python)**
   - **Description**: Measure the memory usage of a specific function or process.
   - **Sample Prompt:** ```Write a python script to measure the memory usage of a specific user-selected process```
   - **Test Case**:
     - **Input**: Python function that uses a significant amount of memory
     - **Expected Output**: Memory usage in megabytes (MB)

   - **Test Code**:

   ```python
   import psutil
   
   def get_process_pid(process_name):
       for proc in psutil.process_iter(['pid', 'name']):
           if process_name.lower() in proc.info['name'].lower():
               return proc.info['pid']
       return None
   
   def get_memory_usage(pid):
       process = psutil.Process(pid)
       memory_info = process.memory_info()
       return memory_info.rss / (1024 * 1024)  # Convert to MB
   
   # Prompt the user to enter the process name
   process_name = input("Enter the name of the process to monitor: ")
   
   # Get the PID of the selected process
   pid = get_process_pid(process_name)
   
   if pid is not None:
       # Get the memory usage of the process
       memory_usage = get_memory_usage(pid)
       print(f"Memory usage of process '{process_name}': {memory_usage:.2f} MB")
   else:
       print(f"No process with name '{process_name}' found.")
   ```

   This code uses the `psutil` library to measure memory usage.

3. **Example: Disk Space Usage Test (Shell Script)**
   - **Description**: Evaluate the amount of free disk space on a specific drive or partition.
   - **Sample Promt**: ```Write a python script to measure the available free space on a specific partition.```
   - **Test Case**:
     - **Input**: Drive or partition path
     - **Expected Output**: Free space in gigabytes (GB)

   - **Test Code**:

   ```python
   import psutil
   
   def get_partition_free_space(partition):
       try:
           partition_info = psutil.disk_usage(partition)
           return partition_info.free / (1024 * 1024 * 1024)  # Convert to GB
       except Exception as e:
           return str(e)
   
   # Define the partition you want to check (e.g., 'C:\\' on Windows or '/' on Linux)
   partition = '/'  # Replace with your specific partition
   
   # Get the available free space on the partition
   free_space = get_partition_free_space(partition)
   
   if isinstance(free_space, float):
       print(f"Available free space on partition '{partition}': {free_space:.2f} GB")
   else:
       print(f"Error: {free_space}")
   ```

In these examples, resource usage tests focus on measuring specific aspects like CPU usage, memory usage, or disk space. The code provides a means to perform these tests and obtain relevant resource usage information.
