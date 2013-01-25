class Quiz < ActiveRecord::Base	
  # attr_accessible :title, :body

  attr_accessible :name, :assigns_to, :questions_attributes

  has_many :questions
  has_many :quiz_users
  has_many :users, :through => :quiz_users

  accepts_nested_attributes_for :questions

  
end
