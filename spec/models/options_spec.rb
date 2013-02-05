require "spec_helper"

describe Option do 
  describe "validations"	do
  	it { should validate_presence_of(:label) }
  	it { should validate_presence_of(:value) }
  end
end