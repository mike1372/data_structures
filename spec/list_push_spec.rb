require_relative '../list'

RSpec.describe List do

	context "push" do
		it "adds an item to the end of a list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.push(6).test_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> nil >"
		end

		it "adds an item to the end of a list with only one item" do
			list = List.new(1)
			expect(list.push(2).test_print).to eq "< 1 -> 2 -> nil >"
		end

		it "adds an item to the end of an empty list" do
			list = List.new
			expect(list.push(1).test_print).to eq "< 1 -> nil >"
		end
	end
end
