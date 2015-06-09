require_relative '../list'

RSpec.describe List do

	context "sort" do
		it "sorts a list" do
			list = List.new(2, 4, 1, 5, 3)
			expect(list.sort.test_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> nil >"
		end

		it "handles a list with only one item" do
			list = List.new(1)
			expect(list.sort.test_print).to eq "< 1 -> nil >"
		end

		it "handles an empty list" do
			list = List.new
			expect(list.sort.test_print).to eq "< nil >"
		end
	end
end