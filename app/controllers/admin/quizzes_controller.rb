class Admin::QuizzesController < ApplicationController
	def new
		@quiz = Quiz.new
    radio = Radio.new
    text_field = Textfield.new
    text_area = Textarea.new
    radio.options.build
    #radio.options.build
    @quiz.questions = [radio, text_field, text_area ]
    #@questions.options.build
    #@quiz.questions.each{ |q| q.options.build }
  	# @users = User.select("users.id, user_profiles.user_name").joins(:user_profile).collect{|c|[c.id, c.user_name]}
  	#@user_names = User.select("user_profiles.user_name").joins(:user_profile).collect(&:user_name)
    u = User.select("user_profiles.user_name, users.id").joins(:user_profile)
    @user_names = u.map{|k| {id: k.id, name: k.user_name}}
	end

  def index
    @quizzes = Quiz.all
  end

	def create
    @user = User.find_by_id(params[:quiz][:assigns_to])
  	@quiz = @user.quizzes.new(params[:quiz])    
  	if @user.quizzes.create!(params[:quiz])    
      AssignQuiz.welcome_user(@user).deliver
  		flash[:notice] = 'Successfully Created New Quiz'

  		redirect_to admin_dashboards_path
  	else
  		flash[:notice] = 'Quiz not Created'
  		render new_quiz_admin_dashboards_path
  	end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @user = User.find_by_id(params[:quiz][:assigns_to])
    @quiz = @user.quizzes.find(params[:id])
    if @quiz.update_attributes!(params[:quiz])
      flash[:notice] = "Quiz is Updated Successfully"
      redirect_to admin_quizzes_path
    else
      flash[:notice] = "You have entered something wrong please check"
      render edit_admin_quiz_path
    end
  end
end
