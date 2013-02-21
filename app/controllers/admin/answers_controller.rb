class Admin::AnswersController < ApplicationController
	before_filter :check_admin

	def index
		@user = User.find(params[:user_id])
		@quiz_user = @user.quiz_users.find_by_quiz_id(params[:quiz_id])
		@quiz = @user.quizzes.find(params[:quiz_id])
		@questions = @quiz.questions
	end
end
