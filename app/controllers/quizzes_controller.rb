class QuizzesController < ApplicationController

	def index
		 @quizzes = current_user.quizzes
		 @quiz_answered = current_user.quiz_users.joins(:answers).select("DISTINCT quiz_id").pluck(:quiz_id)
	end

	def result
		@quiz_user = current_user.quiz_users.find_by_quiz_id(params[:quiz_id])
		@quiz = current_user.quizzes.find(params[:quiz_id])
		@questions = @quiz.questions
	end
end
