class Answer < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :question_id, :quiz_user_id, :value

  belongs_to :question
  belongs_to :quiz_users
end
