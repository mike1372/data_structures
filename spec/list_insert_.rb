require_relative '../list'

RSpec.describe List do

	context "insert" do
		it "inserts an item into a list after the first occurrence of that item" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.insert(3, 3).test_print).to eq "< 1 -> 2 -> 3 -> 3 -> 4 -> 5 -> nil >"
		end

		it "inserts an item into a list after the first item" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.insert(1, 1).test_print).to eq "< 1 -> 1 -> 2 -> 3 -> 4 -> 5 -> nil >"
		end

		it "inserts an item into a list after the last item" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.insert(5, 6).test_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> nil >"
		end

		it "handles the item not being present by inserting it at the end of the list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.insert_at(6, 3).test_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> nil >"
		end

		it "handles the item in a list with only one item" do
			list = List.new(1)
			expect(list.insert_at(1, 2).test_print).to eq "< 1 -> 2 -> nil >"
		end

		it "handles the item in a list with only one item not being present" do
			list = List.new(2)
			expect(list.insert_at(6, 3).test_print).to eq "< 2 -> 3 -> nil >"
		end

		it "handles inserting into an empty list" do
			list = List.new
			expect(list.insert_at(1, 1).test_print).to eq "< 1 -> nil >"
		end
	end
end