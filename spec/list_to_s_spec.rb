require_relative '../list'

RSpec.describe List do

	context "to_s" do
		it "generates a string from the list" do
			list = List.new('one', 'two', 'three', 'four', 'five')
			expect(list.to_s).to eq "onetwothreefourfive"
		end

		it "generates a string from the list and handles numbers correctly" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.to_s).to eq "12345"
		end

		it "generates a string from the list with only one item" do
			list = List.new('one')
			expect(list.to_s).to eq "one"
		end

		it "generates an empty string from an empty list" do
			list = List.new
			expect(list.to_s).to eq ""
		end
	end
end