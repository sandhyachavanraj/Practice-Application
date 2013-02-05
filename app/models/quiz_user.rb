class QuizUser < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :starting_time, :ending_time, :quiz_id, :user_id

  belongs_to :quiz
  belongs_to :user
  has_many :answers

 # validates :user_id, :uniqueness => {:scope => :quiz_id}
end
