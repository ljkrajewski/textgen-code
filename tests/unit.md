Certainly! Here are three specific examples of unit tests for correctness:

1. **Example: String Reversal Function**
   - **Description**: Suppose you want to test a function that reverses a given string.
   - **Test Case**:
     - **Input**: "hello"
     - **Expected Output**: "olleh"

   - **Unit Test Code (Python)**:
     ```python
     def test_string_reversal():
         assert string_reversal("hello") == "olleh"
     ```

2. **Example: Fibonacci Sequence Generator**
   - **Description**: Test a function that generates the n-th number in the Fibonacci sequence.
   - **Test Case**:
     - **Input**: n = 6
     - **Expected Output**: 8

   - **Unit Test Code (Python)**:
     ```python
     def test_fibonacci_generator():
         assert fibonacci(6) == 8
     ```

3. **Example: Prime Number Checker**
   - **Description**: Test a function that checks if a given number is prime.
   - **Test Cases**:
     - **Input**: 7
     - **Expected Output**: True
     - **Input**: 4
     - **Expected Output**: False

   - **Unit Test Code (Python)**:
     ```python
     def test_prime_checker():
         assert is_prime(7) == True
         assert is_prime(4) == False
     ```

In these examples, each unit test checks a specific function (e.g., `string_reversal`, `fibonacci`, `is_prime`) with given inputs and compares the actual output to the expected output. If the actual and expected outputs match, the test passes; otherwise, it fails, indicating a potential issue with the function's correctness. These unit tests are written in Python using the `assert` statement to validate the expected behavior of the functions.
