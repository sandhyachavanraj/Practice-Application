class Quiz < ActiveRecord::Base	
  # attr_accessible :title, :body

  attr_accessor :assigns_to

  attr_accessible :name, :created_by, :questions_attributes, :assigns_to, :user_ids

  has_many :questions
  has_many :quiz_users
  has_many :users, :through => :quiz_users

  accepts_nested_attributes_for :questions, :allow_destroy => true

  # validations

  # validates :name, presence: true
  
end
