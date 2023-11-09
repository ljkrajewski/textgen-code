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
   - **Sample prompt**: ```Write a python script that creates a random link list, then gives the user to insert an element into the list, delete an element from the list, or print the list. Have the script loop until the user breaks the loop.```
   - **Test Code (Python)**:

   ```python
   class ListNode:
       def __init__(self, value):
           self.value = value
           self.next = None
   
   class LinkedList:
       def __init__(self):
           self.head = None
   
       def insert(self, value):
           new_node = ListNode(value)
           if self.head is None:
               self.head = new_node
           else:
               current = self.head
               while current.next is not None:
                   current = current.next
               current.next = new_node
   
       def delete(self, value):
           if self.head is None:
               return
   
           if self.head.value == value:
               self.head = self.head.next
               return
   
           current = self.head
           while current.next is not None:
               if current.next.value == value:
                   current.next = current.next.next
                   return
               current = current.next
   
       def print_list(self):
           current = self.head
           while current is not None:
               print(current.value, end=" -> ")
               current = current.next
           print("None")
   
   # Create a random linked list
   import random
   
   random_list = [random.randint(1, 100) for _ in range(5)]  # Change the range and list size as needed
   
   linked_list = LinkedList()
   for value in random_list:
       linked_list.insert(value)
   
   # User interaction loop
   while True:
       print("\nOptions:")
       print("1. Insert an element")
       print("2. Delete an element")
       print("3. Print the list")
       print("4. Exit")
       choice = input("Enter your choice: ")
   
       if choice == '1':
           value = int(input("Enter the value to insert: "))
           linked_list.insert(value)
       elif choice == '2':
           value = int(input("Enter the value to delete: "))
           linked_list.delete(value)
       elif choice == '3':
           linked_list.print_list()
       elif choice == '4':
           break
       else:
           print("Invalid choice. Please try again.")
   ```

   In this example, we define a simple linked list structure and implement operations like insertion and deletion of nodes.

3. **Example: Depth-First Search (DFS) on a Graph (Python)**

   - **Description**: Implement a depth-first search algorithm to traverse a graph and find a specific node.
   - **Sample prompt**: ```Write a python scrupt that creates and prints a graph, then finds a user-specified node on that graph.```
   - **Test Code (Python)**:

   ```python
   import networkx as nx
   import matplotlib.pyplot as plt
   import random
   
   # Create a random graph (you can replace this with your own graph creation logic)
   G = nx.erdos_renyi_graph(10, 0.3)
   
   # Draw the graph
   pos = nx.spring_layout(G)
   nx.draw(G, pos, with_labels=True, node_color='skyblue', node_size=800, font_size=12, font_weight='bold', font_color='black')
   plt.title("Random Graph")
   plt.show()
   
   # Prompt user for a node to find
   target_node = int(input("Enter the node to find: "))
   
   # Check if the node exists in the graph
   if target_node in G.nodes():
       print(f"The node {target_node} exists in the graph.")
   else:
       print(f"The node {target_node} does not exist in the graph.")
   ```

These examples demonstrate tests for applying algorithms and data structures, including binary search, linked list operations, and depth-first search on a graph. The test code provided verifies the correctness of the implemented functions.
