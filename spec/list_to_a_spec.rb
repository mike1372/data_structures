require_relative '../list'

RSpec.describe List do

	context "to_a" do
		it "generates an array from the list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.to_a).to eq [1, 2, 3, 4, 5]
		end

		it "generates an array from the list with only one item" do
			list = List.new(1)
			expect(list.to_a).to eq [1]
		end

		it "generates an empty array from an empty list" do
			list = List.new
			expect(list.to_a).to eq []
		end
	end
end