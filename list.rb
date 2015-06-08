
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
	attr_reader :head

	# Note that nodes after @head are not named and cannot be accessed directly
	def initialize(*args)
		if args.length > 0
			@head = Node.new(args.shift)
			pointer = @head
			while args != []
				pointer.next = Node.new(args.shift)
				pointer = pointer.next
			end
		else
			@head = nil
		end
	end

	def length
		if @head
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

	def pretty_print
		pointer = @head
		print "< "
		while pointer
			print pointer.data
			print " -> "
			pointer = pointer.next
		end
		puts "nil >"
		return self
	end

	def test_print
		pointer = @head
		result = "< "
		while pointer
			result << pointer.data.to_s
			result << " -> "
			pointer = pointer.next
		end
		result << "nil >"
		return result
	end

	def include?(data)
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

	def to_s
		result = ""
		pointer = @head
		while pointer
			result << pointer.data.to_s
			pointer = pointer.next
		end
		return result
	end

	def reverse
		pointer = @head
		# Only want to reverse if there are two or more nodes in the list
		if pointer && pointer.next
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
		return pretty_print
	end

	# Inserts an item at the end of the list
	def push(data)
		pointer = @head
		previous = @head
		if @head == nil # Empty list
			@head = Node.new(data)
		else
			while pointer.next
				pointer = pointer.next
			end
			pointer.next = Node.new(data)
		end
		return pretty_print
	end

	# Removes an item from the end of a list
	def pop
		pointer = @head
		if @head == nil
			return nil
		elsif @head.next == nil
			@head = nil
		else
			while pointer.next
				previous = pointer
				pointer = pointer.next
			end
			previous.next = nil
		end
		return pointer.data
	end

	# Removes an item from the start of a list
	def shift
		if @head
			result = @head.data
			@head = @head.next
			return result
		else
			return nil
		end
	end

 	# Inserts an item at the start of a list
	def unshift(data)
		pointer = @head
		@head = Node.new(data)
		@head.next = pointer
		return pretty_print
	end

	def each(&block)
		pointer = @head
		while pointer
			result = yield(pointer.data) # block.call() would also work here
			if result	# Prevents destruction of original data if the block does not return it
				pointer.data = result
			end
			pointer = pointer.next
		end
		return pretty_print
	end

	# This is a bit of a cheat, want to manipulate the list directly without resorting to other data structures
	def uniq
		result = to_a
		result = result.uniq

		pointer = @head
		while result.length > 1
			pointer.data = result.shift
			pointer = pointer.next
		end

		if pointer
			pointer.data = result.shift
			pointer.next = nil
		end

		return pretty_print
	end

	# Shifts values in the list to the left by number, values that fall off the front of the list are added back to the rear
	def rotate_left(number)
		pointer = @head
		while pointer.next			
			pointer = pointer.next
		end
		pointer.next = @head # Make the list circular

		pointer2 = @head
		previous = pointer2
		number.times do
			previous = pointer2
			pointer2 = pointer2.next
		end

		@head = pointer2
		previous.next = nil

		return pretty_print
	end

	def rotate_right(number)
		rotate_left(length - number)
	end

	# This is also a bit of a cheat, want to manipulate the list directly without resorting to other data structures
	def sort
		unsorted = to_a
		sorted = unsorted.sort
		pointer = @head
		while pointer
			pointer.data = sorted.shift
			pointer = pointer.next
		end
		return pretty_print
	end

	# Returns the data at the nth node (starting at 1)
	def get(index)
		pointer = @head
		if index > 0
			index -= 1
			counter = 0
			while counter < index
				if !pointer
					return nil
				end
				pointer = pointer.next
				counter += 1
			end
			if pointer
				return pointer.data
			else
				return nil
			end
		else
			return nil
		end
	end

	# Will add new_data after the node containing the first instance of data in the list
	def insert(data, new_data)
		pointer = @head
		while pointer
			if pointer.data == data
				new_node = Node.new(new_data)
				new_node.next = pointer.next
				pointer.next = new_node
				return pretty_print
			end
			pointer = pointer.next
		end
		return false
	end

	# Will add new_data after the speficied node index, specify zero to add to the front of the list
	def insert_at(index, new_data)
		if index >= 0 && index <= length
			new_node = Node.new(new_data)
			pointer = @head
			if index == 0
				@head = new_node
				@head.next = pointer
			else
				index -= 1

				index.times do
					pointer = pointer.next
				end

				new_node.next = pointer.next
				pointer.next = new_node
			end

			return pretty_print
		else
			return false
		end
	end

	# Will inject a set of values into the list after index, creating a new node for each value given
	def inject(index, *args)
		if index >= 0 && index <= length
			# Create the new list segment
			start = Node.new(args.shift)
			pointer = start
			while args != []
				pointer.next = Node.new(args.shift)
				pointer = pointer.next
			end
			finish = pointer

			pointer = @head
			if index == 0
				finish.next = pointer
				@head = start
			else
				index -= 1

				index.times do
					pointer = pointer.next
				end

				finish.next = pointer.next
				pointer.next = start
			end

			return pretty_print
		else
			return false
		end
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
		return false
	end

	# Will delete the first instance of the specified data in the list
	def delete(data)
		pointer = @head
		# Case where the data is in the head of the list
		if pointer.data == data
			@head = pointer.next
			#pointer = nil
		elsif pointer.next
			previous = pointer
			pointer = pointer.next
			while pointer
				# Assign the previous node to the node after the current one and remove the redundant node
				if pointer.data == data
					previous.next = pointer.next
					#pointer = nil
					return true
				end
				pointer = pointer.next
			end
		end
		return false
	end

	# Deletes the specified node at index
	def delete_at(index)
		if index > 0 && index <= length
			pointer = @head
			if index == 1
				@head = @head.next
			elsif pointer.next
				counter = 0
				while counter < index - 1
					previous = pointer
					pointer = pointer.next
					counter += 1
				end
				previous.next = pointer.next
			end
			return pretty_print
		else
			return false
		end
	end

	# Deletes all specified data from the list, including duplicate items
	def delete_all(*args)
		#pointer = @head
		while args != []
			data = args.shift
			pointer = @head
			while pointer && pointer.data == data
				@head = pointer.next
				pointer = @head
			end
			if pointer
				previous = pointer
				pointer = pointer.next
				while pointer
					# Assign the previous node to the node after the current one and remove the redundant node
					if pointer.data == data
						previous.next = pointer.next
						pointer = pointer.next
					else
						previous = pointer
						pointer = pointer.next
					end
				end
			end
		end
		return pretty_print
	end

	def clear
		@head = nil
		return pretty_print
	end

end
