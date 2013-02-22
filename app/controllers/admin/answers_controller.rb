class Admin::AnswersController < ApplicationController
	before_filter :check_admin

	def index
		@user = User.find(params[:user_id])
		@quiz_user = @user.quiz_users.find_by_quiz_id(params[:quiz_id])
		@quiz = @user.quizzes.find(params[:quiz_id])
		@questions = @quiz.questions
	end

	def check_answers
		@answer = Answer.find(params[:id])
		@answer.status_of_answer = params[:status_of_answer]
		@answer.save
		render nothing: true
	end
end
