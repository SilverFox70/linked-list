##
# This class represents a basic node.
class Node
	attr_accessor :value, :link_to
	##
	# Creates a new node. If no value is passed to
	# link_to the default link_to value will be nil.
	# Nodes are agnostic as to what type of data may
	# be stored in +value+
	def initialize(value, link_to = nil)
		@value = value
		@link_to = link_to
	end
end

##
# This class represents a basic linked list 
# implementing the Node Class
class Linked_List
	attr_accessor :head
	
	##
	# Creates new list setting the Head Node
	# with a value of +value+
	def initialize(value)
		@head = Node.new(value)
		@current_node = @head
	end

	##
	# Returns the current node, which is also 
	# the most recent node added
	def node
		@current_node
	end

	##
	# Appends a node to the end of the list
	def add(value)
		new_node = Node.new(value)
		@current_node.link_to = new_node
		@current_node = @current_node.link_to
	end

	##
	# Returns the size of the list as a count
	# of the number of nodes.
	def size
		counter = 0
		self.each_node {|n| counter += 1}
		counter
	end

	##
	# Deletes the node whose value matches the
	# value passed in.
	def delete(value, all=false)
		node = @head
		deleted_node = nil
		if node.value == value
			@head = @head.link_to
		end
			self.each_node do |n|
				if (!n.link_to.nil?) && (n.link_to.value == value)
					deleted_node = n.link_to
					n.link_to = n.link_to.link_to
					break unless all
				end
			end
		# end
		deleted_node
	end

	##
	# Deletes all nodes whose value equals the
	# value passed in.
	def delete_all(value)
		deleted_node = self.delete(value, true)
	end

	##
	# Adds a new node to the beginning of the
	# list.  This new node is now the head.
	def unshift(value)
		node = Node.new(value)
		node.link_to = @head
		@head = node
		@current_node = @head
	end

	##
	# Insert a node into the list at the position
	# just before the specified index
	def insert(value, index)
		if index == 0
			self.unshift(value)
			return
		end
		new_node = Node.new(value)
		pos = 1
		self.each_node do |node|
			if pos == index
				new_node.link_to = node.link_to
				node.link_to = new_node
				pos += 1
			end
		end
	end

	##
	# Update the node at the given index with the
	# new value
	def update(value, index)
		pos = 0
		updated = false
		self.each_node do |node|
			if pos == index
				node.value = value
			end
		end
		updated
	end

	##
	# Update all nodes whose value equals the
	# old_value
	def update_all(old_value, new_value)
		updated = false
		self.each_node do |node| 
			node.value = new_value if node.value == old_value
		end
	end

	##
	# Returns a newline delimited string containing
	# the values of all nodes in the list
	def display
		str = ""
		self.each_node {|n| str << "node: #{n.value} \n"}
		str
	end

	##
	# Places all the values of all nodes into an array.
	# The head of the list is at index 0.
	def to_a
		arr = []
		self.each_node {|node| arr << node.value}
		arr
	end

	##
	# Iterator for traversing the list starting at the head
	def each_node
		node = @head
		while !node.nil?
			yield node
			node = node.link_to
		end
	end

	##
	# Returns true if the list is empty, false otherwise
	def is_empty?
		@head.nil?
	end
end


#====================================
#Simple tests
#====================================
my_list = Linked_List.new("node 1")
link_node = my_list.add("node 2")

for i in 1..7
	my_list.add("node #{i}")
end

puts "count: #{my_list.size()}"
puts my_list.display
puts "-" * 30
puts my_list.delete_all("node 1")
puts my_list.display
puts "-" * 30
my_list.unshift("node A")
puts my_list.display
puts "-" * 30
my_list.insert("node B",0)
puts my_list.display
my_list.update_all("node 2", "node C")
puts my_list.display
p my_list.to_a

