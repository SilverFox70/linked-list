class Node
	attr_accessor :value, :link_to
	def initialize(value, link_to = nil)
		@value = value
		@link_to = link_to
	end
end

class Linked_List
	attr_accessor :head
	
	def initialize(value)
		@head = Node.new(value)
		@current_node = @head
	end

	def node
		@current_node
	end

	def add(value)
		new_node = Node.new(value)
		@current_node.link_to = new_node
		@current_node = @current_node.link_to
	end

	def count_nodes
		counter = 0
		self.each_node {|n| counter += 1}
		counter
	end

	def delete(value, all=false)
		node = @head
		deleted_node = nil
		if node.value == value
			@head = @head.link_to
		else
			self.each_node do |n|
				if (!n.link_to.nil?) && (n.link_to.value == value)
					deleted_node = n.link_to
					n.link_to = n.link_to.link_to
					break unless all
				end
			end
		end
		deleted_node
	end

	def delete_all(value)
		deleted_node = self.delete(value, true)
	end

	def display
		str = ""
		self.each_node {|n| str << "node: #{n.value} \n"}
		str
	end

	def each_node
		node = @head
		while !node.nil?
			yield node
			node = node.link_to
		end
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

puts "count: #{my_list.count_nodes()}"
puts my_list.display
puts "-" * 30
# my_list.delete("node 3")
puts my_list.delete_all("node 3")
puts my_list.display


