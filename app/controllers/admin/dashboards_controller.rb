class Admin::DashboardsController < ApplicationController
  before_filter :check_admin

  def index 
    @user_profiles = UserProfile.all
    @user_profiles = UserProfile.paginate(:page => params[:page], :per_page => 5)
  end

  # def new_quiz
  # 	@quiz = Quiz.new
  #   radio = Radio.new
  #   text_field = Textfield.new
  #   text_area = Textarea.new
  #   radio.options.build
  #   #radio.options.build
  #   @quiz.questions = [radio, text_field, text_area ]
  #   #@questions.options.build
  #   #@quiz.questions.each{ |q| q.options.build }
  # 	# @users = User.select("users.id, user_profiles.user_name").joins(:user_profile).collect{|c|[c.id, c.user_name]}
  # 	#@user_names = User.select("user_profiles.user_name").joins(:user_profile).collect(&:user_name)
  #   u = User.select("user_profiles.user_name, users.id").joins(:user_profile)
  #   @user_names = u.map{|k| {id: k.id, name: k.user_name}}
  # end
  
  # def create_quiz
  #   @user = User.find_by_id(params[:quiz][:assigns_to])
  # 	@quiz = Quiz.new(params[:quiz])
  # 	if @quiz.save
  #     AssignQuiz.welcome_user(@user).deliver
  # 		flash[:notice] = 'Successfully Created New Quiz'

  # 		redirect_to admin_dashboards_path
  # 	else
  # 		flash[:notice] = 'Quiz not Created'
  # 		render new_quiz_admin_dashboards_path
  # 	end
  # end
end