class QuizzesController < ApplicationController

	def index 
		 @quizzes = current_user.quizzes
		 @quiz_answered = current_user.quiz_users.joins(:answers).select("DISTINCT quiz_id").pluck(:quiz_id)
	end
end
