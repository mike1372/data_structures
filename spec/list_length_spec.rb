require_relative '../list'

RSpec.describe List do

	context "length" do
		it "gets the length of a list with zero items" do
			list = List.new
			expect(list.length).to eq 0
		end

		it "gets the length of a list with one item" do
			list = List.new(1)
			expect(list.length).to eq 1
		end

		it "gets the length of a list with multiple items" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.length).to eq 5
		end
	end
end