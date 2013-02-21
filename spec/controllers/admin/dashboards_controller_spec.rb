require 'spec_helper'

describe Admin::DashboardsController do
	login_admin

  describe "Get index" do
  	before do
  		@user = FactoryGirl.create(:admin)
			controller.stub(:current_user).and_return(@user)
  		@user_profile = FactoryGirl.create(:user_profile, :user_id => @user.id)
  	end

    it "should return all users profiles" do
      get :index
      assigns[:user_profiles].first.should eql(@user_profile)
    end

    it "render the index template" do
			get "index"
			response.should render_template("index")
		end
  end
end