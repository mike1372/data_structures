require_relative '../list'

RSpec.describe List do

	context "uniq" do
		it "removes duplicates from a list" do
			list = List.new(1, 2, 3, 4, 5, 4, 2, 5, 3, 1, 1, 1, 4)
			expect(list.uniq.test_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> nil >"
		end

		it "does not remove duplicates from a list with none" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.uniq.test_print).to eq "< 1 -> 2 -> 3 -> 4 -> 5 -> nil >"
		end

		it "handles an empty list" do
			list = List.new
			expect(list.uniq.test_print).to eq "< nil >"
		end
	end
end