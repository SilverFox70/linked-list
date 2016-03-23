class Node
	attr_accessor :value, :link_to
	def initialize(value, link_to = nil)
		@value = value
		@link_to = link_to
	end
end

class Linked_List
	def initialize(value)
		@head = Node.new(value)
		@current_node = @head
	end

	def add(value)
		new_node = Node.new(value)
		@current_node.link_to = new_node
		@current_node = @current_node.link_to
	end

	def count_nodes
		node = @head
		counter = 0
		while !node.link_to.nil?
			node = node.link_to
			counter += 1
		end
		count
	end
end


#====================================
#Simple tests
#====================================
current_node = Linked_List.new("first node")
link_node = Linked_List.add("second node")
# for i in 1..8
# 	new_node = Node.new(i)
# 	current_node.link = new_node
# 	current_node = current_node.link
# 	puts "node #{i} complete"
# end

puts "node: #{current_node.value} \t object: #{current_node}"
puts "node: #{current_node.link_to}"
puts "node: #{current_node.link_to.value}"
puts "count: #{current_node.count_nodes()}"

# current_node.each_node {|n| puts "node: #{n}"}

