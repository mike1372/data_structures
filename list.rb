# Simple linked list node, note it has only one pointer looking forward

class Node
	attr_accessor :data, :next

	def initialize(data)
		@data = data
		@next = nil
	end

end

# List class to model the (singly) linked list with some basic methods

class List

	# Note that nodes after @head are not named and cannot be accessed directly
	def initialize(*args)
		@head = Node.new(args.shift)
		pointer = @head
		while args != []
			p args
			pointer.next = Node.new(args.shift)
			pointer = pointer.next
		end
	end

	def length
		if @head.data
			pointer = @head
			counter = 1
			while pointer.next
				counter += 1
				pointer = pointer.next
			end
			return counter
		else
			return 0
		end
	end

	def print
		pointer = @head
		while pointer
			puts pointer.data
			pointer = pointer.next
		end
	end

	def is_present(data)
		pointer = @head
		while pointer
			if pointer.data == data
				return true
			end
			pointer = pointer.next
		end
		return false
	end

	def to_a
		result = []
		pointer = @head
		while pointer
			result << pointer.data
			pointer = pointer.next
		end
		return result
	end

	def each
		# Yet to be implemented
	end

	def uniq
		# Yet to be implemented
	end

	def reverse
		pointer = @head
		# Only want to reverse if there are two or more nodes in the list
		if pointer.next
			previous = pointer
			pointer = pointer.next
			nexxt = pointer.next
			previous.next = nil
			while nexxt
				pointer.next = previous # Reverse the link direction
				previous = pointer
				pointer = nexxt
				nexxt = nexxt.next
			end
			@head = pointer
			@head.next = previous
		end
	end

	def rotate
		# Yet to be implemented
	end

	def sort
		# Yet to be implemented
	end

	# Inserts an item at the end of the list
	def push(data)
		pointer = @head
		previous = @head
		while pointer.next
			pointer = pointer.next
		end
		pointer.next = Node.new(data)
	end

	def pop
		# Yet to be implemented
	end

	def shift
		# Yet to be implemented
	end

	def unshift
		# Yet to be implemented
	end

	# Returns the data at the nth node (starting at 0)
	def get(index)
		# Yet to be implemented
	end

	# Returns the data at the nth node (starting at 0)
	def del(index)
		# Yet to be implemented
	end

	# Will add new_data after the node containing the first instance of data in the list
	def insert_after(data, new_data)
		pointer = @head
		while pointer
			if pointer.data == data
				new_node = Node.new(new_data)
				new_node.next = pointer.next
				pointer.next = new_node
				return
			end
			pointer = pointer.next
		end
		print_error
	end

	# Will update the first instance of the specified data in the list
	def update(data, new_data)
		pointer = @head
		while pointer
			if pointer.data == data
				pointer.data = new_data
				return
			end
			pointer = pointer.next
		end
		print_error
	end

	# Will delete the first instance of the specified data in the list
	def delete(data)
		pointer = @head

		# Case where the data is in the head of the list
		if pointer.data == data
			@head = pointer.next
			pointer = nil
		elsif pointer.next
			previous = pointer
			pointer = pointer.next
			while pointer
				# Assign the previous node to the node after the current one and remove the redundant node
				if pointer.data == data
					previous.next = pointer.next
					pointer = nil
					return
				end
				pointer = pointer.next
			end
		end
		print_error
	end

	# Deletes all specified data nodes from the list
	def delete_all(data)
		# Yet to be implemented
	end

	def clear
		@head.data = nil
		@head.next = nil
	end

	private

	def print_error
		puts "Item not found in the list."
	end

end
