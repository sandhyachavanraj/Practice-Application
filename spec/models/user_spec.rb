require 'spec_helper'

describe User do
  it { should have_one(:user_profile) } 
  it { should have_many(:quiz_users) }
  it { should have_many(:quizzes).through(:quiz_users) }
  
	describe "validations" do
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:password) }

		it { should validate_format_of(:email).
                                   with('sandhya@test.com') }
                               
    it { should validate_format_of(:email).
                                   not_with('test@.com') }

    it { should ensure_length_of(:password).
              is_at_least(7).
              is_at_most(15) }

    it { should validate_confirmation_of(:password) }
	end
end

