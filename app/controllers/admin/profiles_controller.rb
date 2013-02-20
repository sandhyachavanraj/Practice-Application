class Admin::ProfilesController < ApplicationController
 
	def show
		 @user_profile = UserProfile.find_by_user_id params[:id]
	end

	def edit
		@user_profile = UserProfile.find_by_user_id params[:id]
	end

	def update
		@user_profile = UserProfile.find_by_user_id params[:id]
    	if @user_profile.update_attributes(params[:user_profile])
      		flash[:notice] = "Success"
      		redirect_to admin_dashboards_path
    	else
      		render :edit
    	end
	end

	def destroy
    	@user_profile = UserProfile.find_by_user_id params[:id]
    	@user_profile.destroy
    	flash[:notice] = 'Destroyed Successfully'
    	redirect_to admin_dashboards_path
  	end

  def deactivate
    @user = User.find_by_id params[:id]
    if @user.deactivate
      flash[:notice] = "deactivated successfully"
    else
      flash[:error] = 'Exeception occur'
    end
    redirect_to admin_dashboards_path
  end

  def activate
    @user = User.find_by_id params[:id]
    if @user.activate
      flash[:notice] = "activated successfully"
    else
      flash[:error] = 'Exeception occur'
    end
    redirect_to admin_dashboards_path
  end
    
end
