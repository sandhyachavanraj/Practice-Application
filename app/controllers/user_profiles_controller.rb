class UserProfilesController < ApplicationController
   
  def show
    @user_profile = current_user.user_profile
    authorize! :show, @user_profile
  end

  def edit
    @user_profile = current_user.user_profile
  end
  
  def update
    @user_profile = current_user.user_profile
    if @user_profile.update_attributes(params[:user_profile])
      flash[:notice] = "Success"
      redirect_to profile_path
    else
      render :edit
    end
  end  
end
