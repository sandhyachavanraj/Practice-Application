class Question < ActiveRecord::Base
  # attr_accessible :title, :body
  self.inheritance_column = 'input_type'

  attr_accessible :name, :input_type
  belongs_to :quiz
  has_many :answers

end
