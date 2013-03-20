class UserProfilesController < ApplicationController
  def new
    @user_profile = UserProfile.new
  end
  
  def show
    @user_profile = current_user.user_profile
    authorize! :show, @user_profile
  end
  # def edit
  #   @user_profile = current_user.user_profile
  # end
  
  def update
    @user_profile = current_user.user_profile
    if @user_profile.update_attributes(params[:user_profile])
      flash[:notice] = "Success"
      redirect_to profile_path
    else
      render edit_profile_path
    end
  end

  def destroy
    @user_profile = UserProfile.find_by_user_id params[:id]
    @user_prfile.destroy
    flash[:notice] = 'Destroyed Successfully'
    redirect_to admin_dashboards_path
  end
end
