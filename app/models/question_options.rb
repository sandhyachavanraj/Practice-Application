class QuestionOptions < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :label, :value

  belongs_to :question
end
