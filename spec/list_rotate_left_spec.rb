require_relative '../list'

RSpec.describe List do

	context "rotate_left" do
		it "rotates list items to the left by one" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.rotate_left(1).test_print).to eq "< 2 -> 3 -> 4 -> 5 -> 1 -> nil >"
		end

		it "rotates list items to the left by more than one" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.rotate_left(2).test_print).to eq "< 3 -> 4 -> 5 -> 1 -> 2 -> nil >"
		end

		it "rotates list items to the left by an amount equal to the size of the list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.rotate_left(5).test_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> nil >"
		end

		it "rotates list items to the left by an amount greater than the size of the list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.uniq.rotate_left(6).test_print).to eq "< 2 -> 3 -> 4 -> 5 -> 1 -> nil >"
		end

		it "handles a list with only one item" do
			list = List.new(1)
			expect(list.rotate_left(3).test_print).to eq "< 1 -> nil >"
		end

		it "handles an empty list" do
			list = List.new
			expect(list.rotate_left(3).test_print).to eq "< nil >"
		end
	end
end