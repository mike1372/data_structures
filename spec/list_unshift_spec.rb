require_relative '../list'

RSpec.describe List do

	context "unshift" do
		it "adds an item to the front of a list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.unshift(0).test_print).to eq "< 0 -> 1 -> 2 -> 3 -> 4 -> 5 -> nil >"
		end

		it "adds an item to the front of a list with only one item" do
			list = List.new(1)
			expect(list.unshift(0).test_print).to eq "< 0 -> 1 -> nil >"
		end

		it "adds an item to the end of an empty list" do
			list = List.new
			expect(list.unshift(1).test_print).to eq "< 1 -> nil >"
		end
	end
end