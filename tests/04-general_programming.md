## General Programming Tests
General programming tests assess the ability to write code that solves a variety of problems. Here are three specific examples of general programming tests for generalization, along with sample code or instructions:

1. **Example: Finding the Maximum Element in a List (Python)**

   - **Description**: Write a function that finds the maximum element in a list of numbers.
   - **Sample Prompt**:  ```Write a python script that finds the maximum element in a random-sized list of random numbers.```
   - **Test Code (Python)**:

   ```python
   import random
   
   def find_max_in_random_list():
       # Generate a random-sized list of random numbers
       list_size = random.randint(1, 20)  # Change the range as needed
       random_list = [random.randint(1, 100) for _ in range(list_size)]
   
       if not random_list:
           return None
   
       max_num = random_list[0]
       for num in random_list:
           if num > max_num:
               max_num = num
   
       return random_list, max_num
   
   # Find the maximum element in a random list
   result = find_max_in_random_list()
   
   if result is not None:
       random_list, max_element = result
       print(f"Random List: {random_list}")
       print(f"The maximum element in the list is: {max_element}")
   else:
       print("The generated list is empty.")
   ```

   In this example, the `find_max` function takes a list of numbers and iterates through them to find the maximum element. The `general_programming_test_find_max` function tests this function with two different lists.

2. **Example: Reversing a String (Python)**

   - **Description**: Write a function that reverses a given string.
   - **Test Case**:
     - **Input**: "This is a test string."
     - **Expected Output**: ".gnirts tset a si sihT"
   - **Sample Prompt**:  ```Write a python script that reverses a user-defined string.```
   - **Test Code (Python)**:

   ```python
   def reverse_string(user_input):
       return user_input[::-1]
   
   # Get user input
   user_input = input("Enter a string: ")
   
   # Reverse the string
   reversed_string = reverse_string(user_input)
   
   # Print the reversed string
   print(f"The reversed string is: {reversed_string}")
   ```
   In this example, the `reverse_string` function takes an input string and uses slicing (`[::-1]`) to reverse it. The `general_programming_test_reverse_string` function tests this function with two different input strings.

3. **Example: Calculating Fibonacci Numbers (Python)**

   - **Description**: Write a function that calculates the n-th Fibonacci number.
   - **Sample Prompt**:  ```Write a python script that fcalculates the n-th Fibonacci number where n is provided by the user.```
   - **Test Code (Python)**:

   ```python
   def fibonacci(n):
       if n <= 0:
           return "Please enter a positive integer"
       elif n == 1:
           return 0
       elif n == 2:
           return 1
       else:
           fib = [0, 1]
           for i in range(2, n):
               fib.append(fib[-1] + fib[-2])
           return fib[-1]
   
   # Get user input
   n = int(input("Enter a positive integer (n): "))
   
   # Calculate the n-th Fibonacci number
   result = fibonacci(n)
   
   # Print the result
   print(f"The {n}-th Fibonacci number is: {result}")
   ```

   In this example, the `fibonacci` function recursively calculates the n-th Fibonacci number. The `general_programming_test_fibonacci` function tests this function with two different values of n.

These examples showcase general programming tests that assess the ability to write code that solves different types of problems, including finding maximum elements, reversing strings, and calculating Fibonacci numbers. The test code provided verifies the correctness of the implemented functions.
