class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
  	flash[:notice] = 'Access Denied'
  	redirect_to  dashboards_path
  end

  helper_method :user_profile

  def user_profile
    @user_profile ||= current_user.user_profile
  end
  
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboards_path
    else
      dashboards_path
    end
  end

  def check_admin
    unless current_user.admin?
      flash[:notice] = 'Access Denied'
      redirect_to  dashboards_path
    end
  end
end
