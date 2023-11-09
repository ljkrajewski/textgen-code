## Algorithms and Data Structures Tests
Algorithms and data structures tests assess the ability to apply fundamental algorithms and data structures to solve various types of problems. Here are three specific examples for generalization, along with sample code or instructions:

1. **Example: Binary Search (Python)**

   - **Description**: Write a function that performs a binary search to find the index of a target element in a sorted list.
   - **Sample prompt**: ```Write a python script that prints a randomly generated sorted list and performs a binary search to find the index of a user-defined target element in that list.```
   - **Test Code (Python)**:

   ```python
   import random
   
   def binary_search(sorted_list, target):
       left = 0
       right = len(sorted_list) - 1
   
       while left <= right:
           mid = (left + right) // 2
           mid_element = sorted_list[mid]
   
           if mid_element == target:
               return mid
           elif mid_element < target:
               left = mid + 1
           else:
               right = mid - 1
   
       return -1
   
   # Generate a randomly sorted list
   random_sorted_list = sorted([random.randint(1, 100) for _ in range(10)])  # Change the range and list size as needed
   
   # Print the generated list
   print(f"Generated sorted list: {random_sorted_list}")
   
   # Prompt the user to enter a target element
   target = int(input("Enter the target element to search for: "))
   
   # Perform binary search
   index = binary_search(random_sorted_list, target)
   
   if index != -1:
       print(f"The target element {target} is at index {index}.")
   else:
       print(f"The target element {target} was not found in the list.")
   ```

   In this example, the `binary_search` function performs a binary search on a sorted list to find the index of a target element.

2. **Example: Linked List Operations (Python)**

   - **Description**: Implement basic operations on a singly linked list, such as insertion, deletion, and traversal.
   - **Sample prompt**: 
   - **Test Code (Python)**:

   ```python
   class ListNode:
       def __init__(self, val=0, next=None):
           self.val = val
           self.next = next

   def insert_node(head, val):
       new_node = ListNode(val)
       new_node.next = head
       return new_node

   def delete_node(head, val):
       if head and head.val == val:
           return head.next

       prev, current = None, head

       while current:
           if current.val == val:
               prev.next = current.next
               break
           prev, current = current, current.next

       return head

   def algorithms_test_linked_list():
       linked_list = None
       linked_list = insert_node(linked_list, 5)
       linked_list = insert_node(linked_list, 7)
       linked_list = insert_node(linked_list, 9)
       linked_list = delete_node(linked_list, 7)

       assert linked_list.val == 9
       assert linked_list.next.val == 5
   ```

   In this example, we define a simple linked list structure and implement operations like insertion and deletion of nodes. The `algorithms_test_linked_list` function tests these operations.

3. **Example: Depth-First Search (DFS) on a Graph (Python)**

   - **Description**: Implement a depth-first search algorithm to traverse a graph and find a specific node.
   - **Sample prompt**: 
   - **Test Code (Python)**:

   ```python
   def dfs(graph, start, target, visited=set()):
       visited.add(start)

       if start == target:
           return True

       for neighbor in graph[start]:
           if neighbor not in visited:
               if dfs(graph, neighbor, target, visited):
                   return True

       return False

   def algorithms_test_dfs():
       graph = {
           'A': ['B', 'C'],
           'B': ['D', 'E'],
           'C': ['F'],
           'D': [],
           'E': ['G'],
           'F': ['H'],
           'G': [],
           'H': []
       }

       result_1 = dfs(graph, 'A', 'G')
       result_2 = dfs(graph, 'A', 'H')
       result_3 = dfs(graph, 'A', 'X')  # X is not in the graph

       assert result_1 is True
       assert result_2 is True
       assert result_3 is False
   ```

   In this example, we define a graph and implement a depth-first search (DFS) algorithm to search for a target node. The `algorithms_test_dfs` function tests this algorithm with different target nodes.

These examples demonstrate tests for applying algorithms and data structures, including binary search, linked list operations, and depth-first search on a graph. The test code provided verifies the correctness of the implemented functions.
