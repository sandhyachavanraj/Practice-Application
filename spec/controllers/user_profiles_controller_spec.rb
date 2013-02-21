require "spec_helper"

describe UserProfilesController do
	login_user

	before(:each) do
	  @user = FactoryGirl.create(:user)
		controller.stub(:current_user).and_return(@user)
		@user_profile = FactoryGirl.create(:user_profile, :user_id => @user.id)
	end

	describe "Get Show" do
		it "should display user profile" do
			get :show, :id => @user.id
			assigns[:user_profile].should eql(@user_profile)
		end

		it "should renders the show view" do
			get :show, :id => @user_profile.id
			response.should render_template(:show)
		end
	end

	describe "Get Edit" do
		it "should edit the user_profile" do
			get :edit, :id => @user.id
			assigns[:user_profile].should eql(@user_profile)
		end
	end

	describe "Put#Update" do
		it "should update the user profile" do
			put :update, :id  => @user.id, :user_profile =>  FactoryGirl.attributes_for(:user_profile)
      assigns(:user_profile).should eql(@user_profile)
		end

		it "should set a flash[:notice]" do
      put :update, :id  => @user.id
      flash[:notice].should == "Success"
    end

		it "should redirect to the admin dashboards" do
      put :update, :id  => @user.id
      response.should redirect_to(profile_path)
    end

    context "when the user profile fails to save" do
    	it "should render the edit template"	 do
      	UserProfile.any_instance.stub(:save).and_return(false)
				put :update, :id => @user_profile.id
				response.should render_template("edit")
			end
    end
	end
end