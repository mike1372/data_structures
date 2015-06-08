require_relative '../list'

RSpec.describe List do

	context "include?" do
		it "advises of an item being in the list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.include?(3)).to eq true
		end

		it "advises of an item being in front the list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.include?(1)).to eq true
		end

		it "advises of an item being in rear the list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.include?(5)).to eq true
		end

		it "advises of an item being not in the list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.include?(6)).to eq false
		end
	end
end