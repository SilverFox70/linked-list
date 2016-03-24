# Linked List

This is a basic linked list implemented in Ruby. The [documentation](/doc/table_of_contents.html) provides a description of all available methods, but for your convenience they are also listed here:

### Methods
+ #add - Add a node to the end of the list
+ #size - Count the number of nodes in the list
+ #delete - Delete a node
+ #delete_all - Delete all nodes of a given value
+ #unshift - Add a node to the beginning of the list
+ #insert - Insert a node at a given position
+ #update - Update the value of a node at position
+ #update_all - Update all nodes of a given value
+ #to_a - Get the list as an array object
+ #each_node - An iterator to traverse the list
+ #is_empty - Returns true if the list is 
+ #find_at - Returns the value of the node at the given position

This is mostly an exercise in data structure building,
but if you needed a simple linked list in Ruby, this would work well. There are certainly other methods you may want, such the ability to delete a range of nodes, or to insert another list into the current list. I could also see wanting to return a range of nodes (sub-list) or their values.

As it stands now, the #size method actually iterates through every node in the list, counting them. It would be possible, for the sake of speed with very large lists, to make a @size property of the list instance itself which was constantly updated as operations were performed on the list.