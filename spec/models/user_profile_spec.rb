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

			it { should validate_uniqueness_of(:mobile_number) }

			it { should_not allow_value("586rtr412").for(:mobile_number) }

      it { should_not allow_value("dsfsdfsd").for(:mobile_number) }
	

		it { should ensure_length_of(:mobile_number).
              is_equal_to(10).
              with_message(/is valid/) }
                               
    # it { should validates_format_of(:mobile_number).
    #                                not_with('586412').
    #                                with_message(/is not optional/) }

    

    # it { should validate_format_of(:mobile_number).
    #                                not_with('dsfsdfsd').
    #                                with_message(/is not optional/) }
	end
end

