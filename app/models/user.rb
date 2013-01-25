class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :token_authenticatable, :confirmable,
		:recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable, :omniauthable

	# attr_accessible :title, :body
	attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :user_profile_attributes, :role
       
	#  associations
	has_one :user_profile  
	has_many :quiz_users
	has_many :quizzes, through: :quiz_users
	
	# Setup accessible (or protected) attributes for your model	
	
  
	#Nested attributes
	accepts_nested_attributes_for :user_profile

	def activate
		self.is_active = true
		save
	end

	def deactivate
    	self.is_active = false
    	save
  	end

  	def active_for_authentication?
      super && is_active?
    end

  	
	
end
