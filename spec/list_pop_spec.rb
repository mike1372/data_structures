require_relative '../list'

RSpec.describe List do

	context "pop" do
		it "removes an item from the end of a list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.pop).to eq 5
		end

		it "adds an item to the end of a list with only one item" do
			list = List.new(1)
			expect(list.pop).to eq 1
		end

		it "removes nothing from an empty list" do
			list = List.new
			expect(list.pop).to eq nil
		end
	end
end
