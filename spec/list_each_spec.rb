require_relative '../list'

RSpec.describe List do

	context "each" do
		it "handles a code block to square the list contents" do
			list = List.new(1, 2, 3, 4, 5)
			expect((list.each { |item| item * item }).test_print).to eq "< 1 -> 4 -> 9 -> 16 -> 25 -> nil >"
		end
	end
end