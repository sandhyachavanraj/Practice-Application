class Admin::QuizzesController < ApplicationController
  before_filter :load_object, only: [:new, :create]
  
	def new
		@quiz = Quiz.new
    radio = Radio.new
    text_field = Textfield.new
    text_area = Textarea.new
    listbox = Listbox.new
    checkbox = Checkbox.new
    2.times { radio.options.build }
    5.times { listbox.options.build }
    5.times { checkbox.options.build }
    @quiz.questions = [radio, text_field, text_area, listbox, checkbox ]
	end

  def index
    @quizzes = Quiz.all
  end

  def create
    @quiz = current_user.quizzes.new(params[:quiz])
    if @quiz.save
      flash[:notice] = 'Successfully Created New Quiz'
      redirect_to admin_dashboards_path
    else
      flash[:error] = 'Quiz not Created'
      render :action => :new         
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
    load_object
    # u = User.select("user_profiles.user_name, users.id").joins(:user_profile)
    # @user_names = u.map{|k| {id: k.id, name: k.user_name}}
    @user_ids = @quiz.quiz_users.map(&:user_id)
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(params[:quiz])
      flash[:notice] = "Quiz is Updated Successfully"
      redirect_to admin_quizzes_path
    else
      flash[:notice] = "You have entered something wrong please check"
      render :edit
    end
  end

  private

  def load_object
    u = User.select("user_profiles.user_name, users.id").joins(:user_profile).where(admin: false)
    @user_names = u.map{|k| {id: k.id, name: k.user_name} }
  end
end
