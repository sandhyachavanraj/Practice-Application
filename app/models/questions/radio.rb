class Radio < Question
	#attr_accessible :options_attributes
  has_many :options, :foreign_key => 'question_id', :dependent => :destroy
  accepts_nested_attributes_for :options, :allow_destroy => :true 
end