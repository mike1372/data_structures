require_relative '../list'

RSpec.describe List do

	context "clear" do
		it "empties the contents of a list" do
			list = List.new(1, 2, 3, 4, 5)
			expect(list.clear.test_print).to eq "< nil >"
		end

		it "empties the contents of a list with only one item" do
			list = List.new(1)
			expect(list.clear.test_print).to eq "< nil >"
		end

		it "empties nothing from an empty list" do
			list = List.new
			expect(list.clear.test_print).to eq "< nil >"
		end
	end
end
