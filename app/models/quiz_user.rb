class QuizUser < ActiveRecord::Base
  # attr_accessible 
  attr_accessible :starting_time, :ending_time, :quiz_id, :user_id

  # associations
  belongs_to :quiz
  belongs_to :user
  has_many :answers
end
