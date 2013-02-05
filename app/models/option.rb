class Option < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :label, :value

  belongs_to :questions

  # validations
validates :label, presence: true
validates :value, presence: true
end
