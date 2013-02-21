class Admin::DashboardsController < ApplicationController
  before_filter :check_admin

  def index
    @user_profiles = UserProfile.paginate(page: params[:page], per_page: 5)    
  end  
end