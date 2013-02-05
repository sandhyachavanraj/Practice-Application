require 'spec_helper'



describe Quiz do
	describe "validations" do
		it { should validate_presence_of(:name) }
	end
end