require_relative '../list'

RSpec.describe List do

	context "pretty_print" do
		it "prints a list with zero items" do
			list = List.new
			expect(list.pretty_print).to eq "< nil >"
		end

		it "prints a list with one item" do
			list = List.new(1)
			expect(list.pretty_print).to eq "< 1 -> nil >"
		end

		it "prints a list with many items" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.pretty_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> nil >"
		end
	end
end