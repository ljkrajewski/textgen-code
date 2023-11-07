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
   - **Test Case**:
     - **Input**: Python function that uses a significant amount of memory
     - **Expected Output**: Memory usage in megabytes (MB)

   - **Test Code**:

   ```python
   import sys

   def memory_intensive_task():
       large_data = [0] * (10**6)  # Allocate a large list

   def resource_usage_test():
       before_memory = psutil.virtual_memory().used
       memory_intensive_task()
       after_memory = psutil.virtual_memory().used

       memory_usage = (after_memory - before_memory) / (1024 * 1024)  # Convert to MB

       print(f"Memory Usage: {memory_usage} MB")
   ```

   This code uses the `psutil` library to measure memory usage.

3. **Example: Disk Space Usage Test (Shell Script)**
   - **Description**: Evaluate the amount of free disk space on a specific drive or partition.
   - **Test Case**:
     - **Input**: Drive or partition path
     - **Expected Output**: Free space in gigabytes (GB)

   - **Test Code (Shell Script)**:

   ```bash
   #!/bin/bash

   drive_path="/dev/sda1"  # Example drive path

   function resource_usage_test() {
       free_space=$(df -h $drive_path | awk 'NR==2 {print $4}')
       echo "Free Disk Space: $free_space"
   }

   resource_usage_test
   ```

   Save the above code in a `.sh` file and execute it in a Linux environment.

In these examples, resource usage tests focus on measuring specific aspects like CPU usage, memory usage, or disk space. The code provides a means to perform these tests and obtain relevant resource usage information.
