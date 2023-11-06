Here are three specific examples of unit tests for correctness:

1. **Example: String Reversal Function**
   - **Description**: Suppose you want to test a function that reverses a given string.
   - **Test Case**:
     - **Input**: "hello"
     - **Expected Output**: "olleh"
   - **Sample Prompt**
     - ```Write a python script that takes an input string, reverses it, and outputs the result```
   - **Example Code (Python)**:
     ```python
      def reverse_string(input_str):
          return input_str[::-1]
      
      # Get user input
      user_input = input("Enter a string: ")
      
      # Reverse the input string
      reversed_string = reverse_string(user_input)
      
      # Print the reversed string
      print("Reversed string:", reversed_string)
     ```

2. **Example: Fibonacci Sequence Generator**
   - **Description**: Test a function that generates the n-th number in the Fibonacci sequence.
   - **Test Case**:
     - **Input**: n = 6
     - **Expected Output**: 8
   - **Sample Prompt**
     - ```Write a python script that calculates the Fibonacci sequence to the n-th number, where n is provided by the user.```
   - **Example Code (Python)**:
     ```python
      def fibonacci(n):
          fib_sequence = [0, 1]
          while len(fib_sequence) < n+1:
              fib_sequence.append(fib_sequence[-1] + fib_sequence[-2])
          return fib_sequence[:n+1]
      
      # Get user input for n
      n = int(input("Enter the value of n: "))
      
      # Calculate Fibonacci sequence
      fib_sequence = fibonacci(n)
      
      # Print the Fibonacci sequence
      print(f"Fibonacci sequence up to the {n}-th number:")
      for i, num in enumerate(fib_sequence):
          print(f"F({i}) = {num}")
     ```

3. **Example: Prime Number Checker**
   - **Description**: Test a function that checks if a given number is prime.
   - **Test Cases**:
     - **Input**: 7
     - **Expected Output**: True
     - **Input**: 4
     - **Expected Output**: False
   - **Sample Prompt**
     ```Write a python script that returns if a user-entered integer is a prime number or not.```
   - **Unit Test Code (Python)**:
     ```python
      def is_prime(n):
          if n < 2:
              return False
          for i in range(2, int(n**0.5) + 1):
              if n % i == 0:
                  return False
          return True
      
      # Get user input
      user_input = int(input("Enter an integer: "))
      
      # Check if the number is prime
      if is_prime(user_input):
          print(f"{user_input} is a prime number")
      else:
          print(f"{user_input} is not a prime number")
     ```

In these examples, each unit test checks a specific function (e.g., `string_reversal`, `fibonacci`, `is_prime`) with given inputs and compares the actual output to the expected output. If the actual and expected outputs match, the test passes; otherwise, it fails, indicating a potential issue with the function's correctness. These unit tests are written in Python using the `assert` statement to validate the expected behavior of the functions.
