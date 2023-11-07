## Resource Usage Tests for Performance
Resource usage tests are important for evaluating how efficiently a system utilizes resources like CPU, memory, and disk space. Here are three specific examples of resource usage tests, along with sample code or instructions:

1. **Example: CPU Usage Test (Python)**
   - **Description**: Measure the CPU usage of a specific function or process.
   - **Test Case**:
     - **Input**: Python function that performs a computationally intensive task
     - **Expected Output**: CPU usage percentage

   - **Test Code**:

   ```python
   import time
   import psutil

   def cpu_intensive_task():
       for _ in range(1000000):
           _ = 2 ** 10

   def resource_usage_test():
       start_time = time.time()
       cpu_intensive_task()
       end_time = time.time()

       elapsed_time = end_time - start_time
       cpu_usage = psutil.cpu_percent(interval=1)

       print(f"Elapsed Time: {elapsed_time} seconds")
       print(f"CPU Usage: {cpu_usage}%")
   ```

   This code uses the `psutil` library in Python to measure CPU usage.

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
