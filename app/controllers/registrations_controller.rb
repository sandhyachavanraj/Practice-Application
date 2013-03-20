class RegistrationsController < Devise::RegistrationsController
	def new
		@user = User.new
		@user.build_user_profile
    2.times { @user.photos.build }
	end
	
  def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to dashboards_path, notice: 'You are successfully registerd!'
		else
			render :new
		end
	end
  
	protected
	def after_inactive_sign_up_path_for(resource)
		new_user_session_path
	end
end

