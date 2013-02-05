class Question < ActiveRecord::Base
  # attr_accessible :title, :body
  self.inheritance_column = 'input_type'

  attr_accessible :name, :input_type, :options_attributes
  belongs_to :quiz
  has_many :answers
  has_many :options, :foreign_key => 'question_id', :dependent => :destroy
  
  accepts_nested_attributes_for :options, :allow_destroy => :true 

  # validations

  validates :name, presence: true  
end
