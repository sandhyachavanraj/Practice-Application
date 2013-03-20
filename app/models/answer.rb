class Answer < ActiveRecord::Base
  # attr_accessible
  attr_accessible :question_id, :quiz_user_id, :value, :status_of_answer

  # associations
  belongs_to :question
  belongs_to :quiz_users

  # validations
  validates :value, presence: true

  def self.save_answers(answers, quiz_user_id)
  	error = []
  	transaction do
 		  answers.each do|ans|
  			answer = Answer.new(ans.merge!(quiz_user_id: quiz_user_id))
  			error << answer.errors.full_messages unless answer.save
  		end
  	end
  	return error
  end
end
