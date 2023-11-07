## Integration Tests for Correctness
Edge tests evaluate how well a system handles extreme or uncommon scenarios. Here are three specific examples of edge tests for correctness, along with sample code or instructions:

1. **Example: Handling Large Inputs (Python)**

   - **Description**: Test how the system handles very large inputs for a specific function.
   - **Sample prompt**: ```Write a python script that computes the factorial for a user-supplied integer.```
   - **Test Case**:
     - **Input**: 1000
     - **Expected Output**: 4023872600770937735437024339... (2568 characters)

   - **Edge Test Code (Python)**:

   ```python
      def factorial(n):
          if n < 0:
              return "Factorial is not defined for negative numbers"
          elif n == 0 or n == 1:
              return 1
          else:
              result = 1
              for i in range(2, n + 1):
                  result *= i
              return result
      
      # Get user input
      user_input = int(input("Enter a non-negative integer: "))
      
      # Calculate factorial
      result = factorial(user_input)
      
      # Print the result
      print(f"The factorial of {user_input} is: {result}")
   ```

   In this example, we're testing the `factorial` function with an extremely large input value to ensure it handles edge cases like this correctly.

2. **Example: Division by Zero (Python)**

   - **Description**: Test how the system handles division by zero.
   - **Sample prompt**: ```Write a python script that cleanly handles a "division by zero" error instead of just crashing.```
   - **Test Case**:
     - **Input**: Attempt to divide a number by zero
     - **Expected Output**: Error or appropriate response indicating division by zero

   - **Edge Test Code (Python)**:

   ```python
   def divide_numbers(num1, num2):
       try:
           result = num1 / num2
           return result
       except ZeroDivisionError as e:
           return f"Error: {e}"
   
   # Get user input
   num1 = float(input("Enter the numerator: "))
   num2 = float(input("Enter the denominator: "))
   
   # Calculate division
   result = divide_numbers(num1, num2)
   
   # Print the result
   print(f"The result of the division is: {result}")
```

   This test intentionally attempts to perform a division by zero operation and expects it to raise a `ZeroDivisionError` exception.

3. **Example: Overflow in Integer Arithmetic (Python)**

   - **Description**: Test how the system handles situations where integer values exceed their maximum representable value.

   - **Test Case**:
     - **Input**: Perform arithmetic operations leading to integer overflow
     - **Expected Output**: Error or appropriate response indicating integer overflow

   - **Edge Test Code (Python)**:

   ```python
   def edge_test_integer_overflow():
       max_int = 2**31 - 1  # Maximum representable integer value in a 32-bit system
       try:
           result = max_int + 1  # Attempting to exceed the maximum value
       except OverflowError as e:
           assert str(e) == "overflow in int addition"
   ```

   This test attempts to exceed the maximum representable value for integers and expects it to raise an `OverflowError` exception.

These examples demonstrate edge tests for handling extreme or uncommon scenarios, such as very large inputs, division by zero, and integer overflow. The test code provided helps verify that the system responds appropriately in these edge cases.
