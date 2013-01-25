class QuizUser < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :starting_time, :ending_time

  belongs_to :quiz
  belongs_to :user
  has_many :answers
  
end
