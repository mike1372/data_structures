require_relative '../list'

RSpec.describe List do

	context "update" do
		it "updates an item in a list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.update(3, 6).test_print).to eq "< 1 -> 2 -> 6 -> 4 -> 5 -> nil >"
		end

		it "handles the item not being in the list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.update(6, 7)).to eq false
		end

		it "updates an item in a list with only one item" do
			list = List.new(1)
			expect(list.update(1, 2).test_print).to eq "< 2 -> nil >"
		end

		it "handles the item not being in the list of only one item" do
			list = List.new(1)
			expect(list.update(6, 7)).to eq false
		end

		it "handles an empty list" do
			list = List.new
			expect(list.update(6, 7)).to eq false
		end
	end
end