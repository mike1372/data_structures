require_relative '../list'

RSpec.describe List do

	context "reverse" do
		it "reverses a list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.reverse.test_print).to eq "< 5 -> 4 -> 3 -> 2 -> 1 -> nil >"
		end

		it "does not process a list with one item" do
			list = List.new(1)
			expect(list.reverse.test_print).to eq "< 1 -> nil >"
		end

		it "does not process an empty list" do
			list = List.new
			expect(list.reverse.test_print).to eq "< nil >"
		end
	end
end