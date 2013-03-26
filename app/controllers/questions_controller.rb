class QuestionsController < ApplicationController
	def new
		@question = Question.new
		@quiz = Quiz.find(params[:quiz_id])
		@questions =  @quiz.questions
		@questions.each do |q|
     if q.input_type == 'Radio'
       @values = q.options.map(&:value)
     end
   end
	end

	def index
		@quiz = Quiz.find(params[:quiz_id])
		@questions = @quiz.questions
	end

	def show
		
	end

	def create
		@qz = Quiz.find params[:quiz_id]		
		quiz_user = QuizUser.where({quiz_id: @qz.id, user_id: current_user.id}).first
		params[:question].each do |q|
			a = Answer.new(question_id: q[1]["question_id"], quiz_user_id: quiz_user.id, value: q[1]["answer"])
			a.save
		end
		redirect_to dashboards_path
		flash[:notice] = "Values are saved...!!!"
	end	
end
