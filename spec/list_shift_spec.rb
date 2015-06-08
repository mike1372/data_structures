require_relative '../list'

RSpec.describe List do

	context "shift" do
		it "removes an item from the front of a list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.shift).to eq 1
		end

		it "adds an item to the front of a list with only one item" do
			list = List.new(1)
			expect(list.shift).to eq 1
		end

		it "removes nothing from an empty list" do
			list = List.new
			expect(list.shift).to eq nil
		end
	end
end
