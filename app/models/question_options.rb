class QuestionOptions < ActiveRecord::Base
	# attr_accessible
  attr_accessible :label, :value

  # associations
  belongs_to :question
end
