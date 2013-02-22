class AnswersController < ApplicationController	
	def index
		@quiz = Quiz.find(params[:quiz_id])
		quiz_user = @quiz.quiz_users.find_by_user_id(current_user.id)
		@answers = quiz_user.answers
		@user_quizzes = current_user.quizzes.find(params[:quiz_id])
		@quiz_answered = current_user.quiz_users.joins(:answers).select("DISTINCT quiz_id").pluck(:quiz_id)
	end
	
	def new
		@answer =  Answer.new
		@quiz = Quiz.find(params[:quiz_id])
		@questions = @quiz.questions
	end

	def create
		@quiz = Quiz.find(params[:quiz_id])
		@questions = @quiz.questions
		quiz_user = QuizUser.where({quiz_id: params[:quiz_id], user_id: current_user.id}).first
		@answers = Answer.save_answers(params[:answer][:answer_attributes], quiz_user.id)
		 if @answers.count > 0 
		 	render :action => :new
		 else
		flash[:notice] = "Values saved....!!!"
		redirect_to dashboards_path
	end
	end
end
