class DashboardsController < ApplicationController
  def index
    @user_profile = current_user.user_profile
    #@user_profiles = UserProfile.paginate(:page => params[:page], :per_page => 5)
  end
#   def show
#     @user_profile = current_user.user_profile
# #    if current_user.admin == true 
# #      redirect_to admin_dashboards_path    
# #    end
#   end
end
