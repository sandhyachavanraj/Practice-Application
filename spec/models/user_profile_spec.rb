require 'spec_helper'

describe UserProfile do
	it { should belong_to(:user) }

	describe "validations" do
		it { should validate_presence_of(:user_name) }
		it { should validate_presence_of(:address) }
		it { should validate_presence_of(:company) }
		it { should validate_presence_of(:mobile_number) }		
	  it { should validate_numericality_of(:mobile_number) }
	  
	   	before(:each) do
  	 		@user_profile = FactoryGirl.create(:user_profile)
		  end
		  
		  it { should validate_format_of(:user_name).
              not_with('12D45').
              with_message(/username contains only characters/) }

		  it { should_not allow_value("$@nd#").for(:user_name) }

			it { should validate_uniqueness_of(:mobile_number) }

			it { should_not allow_value("586rtr412").for(:mobile_number) }

      it { should_not allow_value("dsfsdfsd").for(:mobile_number) }
	

			# it { should ensure_length_of(:mobile_number).is_equal_to(10).with_short_message(/mobile_number is the wrong length (should be 10 characters) (0)/) }
                               
     context "validate mobile"do
    	it "does not be save when mobile number is empty" do
      	user_profile = FactoryGirl.build(:user_profile, :mobile_number => "")
       	user_profile.should_not be_valid
       	#user_profile.errors[:mobile_number].should_eq(/can't be blank/)
    	end
    	it "does not valid when mobile number is not in correct format" do
      	user_profile = FactoryGirl.build(:user_profile, :mobile_number => "9876fdd5678")
      	user_profile.should_not be_valid("mobile number can contain only integers" )
    	end
    	it "does valid when mobile number is in correct format" do
      	user_profile = FactoryGirl.build(:user_profile, :mobile_number => "9876545678")
      	user_profile.should be_valid
    	end
  	end
	end
end

