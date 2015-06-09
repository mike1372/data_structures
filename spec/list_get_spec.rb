require_relative '../list'

RSpec.describe List do

	context "get" do
		it "gets an item from a list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.get(3)).to eq 3
		end

		it "gets an item from a list with only one item" do
			list = List.new(1)
			expect(list.get(1)).to eq 1
		end

		it "handles an index that is too high" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.get(6)).to eq nil
		end

		it "handles an index that is too low" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.get(0)).to eq nil
		end

		it "handles an empty list" do
			list = List.new
			expect(list.get(2)).to eq nil
		end
	end
end