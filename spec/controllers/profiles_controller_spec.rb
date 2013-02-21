require 'spec_helper'

describe Admin::ProfilesController do
	login_admin

	before(:each) do
		@user = FactoryGirl.create(:admin)
		controller.stub(:current_user).and_return(@user)
		@user_profile = FactoryGirl.create(:user_profile, :user_id => @user.id)
	end

	describe "Get Show" do
		it "should display user profile details" do
			get :show, :id => @user.id
			assigns[:user_profile].should eql(@user_profile)
		end
	end

	describe "Get Edit" do
		it "should edit the user_profile" do
			get :edit, :id => @user.id
			assigns[:user_profile].should eql(@user_profile)
		end
	end

	describe "Put Update" do
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
      response.should redirect_to(admin_dashboards_path)
    end

    context "when its fails to update" do
    	it "should render the edit template"	 do 
      	UserProfile.any_instance.stub(:save).and_return(false)
				put :update, :id => @user.id
				response.should render_template("edit")
			end
    end
	end

	describe "Delete Destroy" do
		it "should delete an user_profile" do
			expect{get :destroy, :id => @user.id}.to change{UserProfile.count}
		end

		it "should set a flash[:notice]" do
      get :destroy, :id  => @user.id
      flash[:notice].should == "Destroyed Successfully"
    end

		it "should redirect to the admin dashboards" do
      get :destroy, :id  => @user.id
      response.should redirect_to(admin_dashboards_path)
    end
	end

	describe "deactivate the user" do
		context "should deactivate the user account" do
		it {
			get :deactivate, :id => @user.id
			flash[:notice].should include("deactivated successfully")
		}
		end

		it "should set a flash[:notice] if it fails to deactivate" do
			get :deactivate, :id => @user.id
			flash[:notice] = "Exeception occur"
		end

		it "should redirect to the admin dashboards" do
      get :deactivate, :id => @user.id
      response.should redirect_to(admin_dashboards_path)
    end
	end

	describe "deactivate the user" do
		context "should deactivate the user account" do
		 it {
		 	get :activate, :id => @user.id
		 	flash[:notice].should include("activated successfully")
		 }
		 end

		it "should set a flash[:notice] if it fails to activate" do
			get :deactivate, :id => @user.id
			flash[:notice] = "Exeception occur"
		end

		it "should redirect to the admin dashboards" do
      get :deactivate, :id => @user.id
      response.should redirect_to(admin_dashboards_path)
    end
	end
end