class Answer < ActiveRecord::Base
  # attr_accessible 
  attr_accessible :question_id, :quiz_user_id, :value

  # associations
  belongs_to :question
  belongs_to :quiz_users

  # validations
  validates :value, presence: true

  # accepts_nested_attributes_for :answer_attributes

end
