RSpec.describe List do

	context "list creation" do
		it "creates a list from multiple items" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.test_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> nil >"
		end

		it "creates a list from one item" do
			list = List.new(1)
			expect(list.test_print).to eq "< 1 -> nil >"
		end

		it "creates an empty list from no items" do
			list = List.new
			expect(list.test_print).to eq "< nil >"
		end
	end
end