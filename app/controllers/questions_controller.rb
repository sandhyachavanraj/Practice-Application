class QuestionsController < ApplicationController
	def new
		@question = Question.new
		@quiz = Quiz.find(params[:quiz_id])
		@questions =  @quiz.questions
		@questions.each do |q|
     if q.input_type == 'Radio'
       @values = q.options.map(&:value)
     end
     if q.input_type == 'Listbox'
       @listvalues = q.options.map(&:value)
     end
     if q.input_type == 'Checkbox'
     	@check_values = q.options.map(&:value)
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
	  #raise params.inspect
		@msg = []
		@qz = Quiz.find params[:quiz_id]
		quiz_user = QuizUser.where({quiz_id: @qz.id, user_id: current_user.id}).first
		Answer.transaction do
			begin		
				params[:question].each do |q|
					if q[1].has_key?("question_id")
						a = Answer.new(question_id: q[1]["question_id"], quiz_user_id: quiz_user.id, value: q[1]["answer"].is_a?(Array) ? q[1]["answer"].join(',') : q[1]["answer"])
				  	@msg << a.errors.full_messages unless a.save
					end
				end
			rescue
				ActiveRecord::Rollback
			end
		end
		if @msg.count > 0
			flash[:error] = @msg.join(", ")
			redirect_to :action => :new
		else
			flash[:notice] = "Values are saved...!!!"
			redirect_to dashboards_path
		end
	end	
end
