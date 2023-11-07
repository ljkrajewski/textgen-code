## Efficiency and Speed Tests for Performance
Efficiency and speed tests aim to evaluate how well a system performs in terms of execution time and resource utilization. Here are three specific examples of efficiency and speed tests, along with sample code:

1. **Example: Sorting Algorithm Performance Test (Python)**
   - **Description**: Compare the runtime of different sorting algorithms for a large dataset.
   - **Sample Prompt:** ```Write a python script that will sort a list of random numbers of a user-defined length and time how long it takes.  For exceedingly large lists, it does not need to print the list.```
   - **Test Case**:
     - **Input**: 100,000 (or any large integer)
     - **Expected Output**: Time to sort list

   - **Test Code**:

   ```python
   import random
   import time
   
   def generate_random_list(length):
       random_list = [random.randint(1, 100) for _ in range(length)]
       return random_list
   
   def sort_list(random_list):
       start_time = time.time()
       sorted_list = sorted(random_list)
       end_time = time.time()
       return sorted_list, end_time - start_time
   
   # Get user input for list length
   length = int(input("Enter the length of the random list: "))
   
   # Generate a random list
   random_list = generate_random_list(length)
   
   # Sort the list and measure time
   sorted_list, sorting_time = sort_list(random_list)
   
   # Print the original and sorted lists if the length is below a threshold
   if length <= 100:
       print(f"Original random list: {random_list}")
       print(f"Sorted list: {sorted_list}")
   
   print(f"Time taken to sort: {sorting_time:.6f} seconds")
   ```

2. **Example: Database Query Performance Test (SQL)**
   - **Description**: Evaluate the execution time of a complex SQL query on a large dataset.
   - **Sample Prompt:** ```Write a python script that evaluates the execution time of a complex SQL query on a large dataset.```
   - **Test Case**:
     - **Input**: SQL query for retrieving specific information from a database
     - **Expected Output**: Query result set

   - **Test Code**:

   ```python
   import sqlite3
   import time
   
   # Connect to the database
   conn = sqlite3.connect('your_database.db')  # Replace with your database file
   
   # Create a cursor object to execute queries
   cursor = conn.cursor()
   
   # Define the complex SQL query
   complex_query = '''
   SELECT column1, column2, ...
   FROM your_table
   WHERE condition1 AND condition2
   GROUP BY column1
   HAVING condition3
   ORDER BY column2 DESC;
   '''
   
   # Measure execution time
   start_time = time.time()
   
   # Execute the query
   cursor.execute(complex_query)
   
   # Fetch results if needed (optional)
   # results = cursor.fetchall()
   
   # Calculate execution time
   execution_time = time.time() - start_time
   
   # Close the connection
   conn.close()
   
   # Print the execution time
   print(f"Execution time: {execution_time:.4f} seconds")
   ```
   Note that the script as currently written uses SQLite3 and requires a pre-populated database. Adjust your propmt to the type of database you use.

3. **Example: Matrix Multiplication Performance Test (C++)**
   - **Description**: Compare the runtime of different matrix multiplication algorithms.
   - **Sample prompt**" ```Write a python script that compares the runtime of different matrix multiplication algorithms.```
   - **Test Case**:
     - **Input**: Two randomly generated matrices of size 1000x1000
     - **Expected Output**: Resultant matrix

   - **Test Code**:

   ```python
   import numpy as np
   import time
   import numba
   
   # Define matrix dimensions
   n = 1000
   m = 1000
   p = 1000
   
   # Generate random matrices A and B
   A = np.random.rand(n, m)
   B = np.random.rand(m, p)
   
   # Naive Matrix Multiplication
   def naive_matrix_multiplication(A, B):
       C = np.zeros((A.shape[0], B.shape[1]))
       for i in range(A.shape[0]):
           for j in range(B.shape[1]):
               for k in range(B.shape[0]):
                   C[i][j] += A[i][k] * B[k][j]
       return C
   
   # Numpy Matrix Multiplication
   def numpy_matrix_multiplication(A, B):
       return np.dot(A, B)
   
   # Numba-accelerated Matrix Multiplication
   @numba.jit
   def numba_matrix_multiplication(A, B):
       return np.dot(A, B)
   
   # Measure execution time for each algorithm
   start_time = time.time()
   result_naive = naive_matrix_multiplication(A, B)
   naive_time = time.time() - start_time
   
   start_time = time.time()
   result_numpy = numpy_matrix_multiplication(A, B)
   numpy_time = time.time() - start_time
   
   start_time = time.time()
   result_numba = numba_matrix_multiplication(A, B)
   numba_time = time.time() - start_time
   
   # Verify that the results are equivalent
   assert np.allclose(result_naive, result_numpy)
   assert np.allclose(result_naive, result_numba)
   
   print(f"Naive Multiplication Time: {naive_time:.4f} seconds")
   print(f"Numpy Multiplication Time: {numpy_time:.4f} seconds")
   print(f"Numba Multiplication Time: {numba_time:.4f} seconds")
   ```

In these examples, efficiency and speed tests measure the performance of different algorithms or operations. They involve generating inputs (e.g., random data) and timing the execution using suitable functions or tools. The results will provide insights into the relative performance of different approaches.
