require_relative '../list'

RSpec.describe List do

	context "insert at" do
		it "inserts an item into a list after the nth location" do
			list = List.new(1, 2, 4, 5)
			expect(list.insert_at(2, 3).test_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> nil >"
		end

		it "inserts an item into the front of the list" do
			list = List.new(2, 3, 4, 5)
			expect(list.insert_at(0, 1).test_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> nil >"
		end

		it "inserts an item into the rear of the list" do
			list = List.new(1, 2, 3, 4)
			expect(list.insert_at(4, 5).test_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> nil >"
		end


		# How to handle indices out of range - check how Array class handles them and perhaps emulate this?


		it "inserts an item into the front of a list of only one item" do
			list = List.new(2)
			expect(list.insert_at(0, 1).test_print).to eq "< 1 -> 2 -> nil >"
		end

		it "inserts an item into the rear of a list of only one item" do
			list = List.new(1)
			expect(list.insert_at(1, 2).test_print).to eq "< 1 -> 2 -> nil >"
		end

		it "inserts an item into an empty list" do
			list = List.new
			expect(list.insert_at(0, 1).test_print).to eq "< 1 -> nil >"
		end
	end
end