class Question < ActiveRecord::Base
  # attr_accessible 
  self.inheritance_column = 'input_type'

  attr_accessible :name, :input_type, :options_attributes

  # associations
  belongs_to :quiz
  has_many :answers
  has_many :options, foreign_key: 'question_id', dependent: :destroy

  # nested attributes
  accepts_nested_attributes_for :options, allow_destroy: true

  # validations
  validates :name, presence: true  
end
