class User < ActiveRecord::Base
	serialize :preferences
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :token_authenticatable, :confirmable,
		:recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable, :omniauthable

	# attr_accessible :title, :body
	attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :user_profile_attributes, :role, :preferences, :photos_attributes

  attr_accessor :mail_type

  ACCOUNT_TYPES = ["gmail", "yahoo", "hotmail"]

	#  associations
#	has_many_friends
	has_one :user_profile
  has_many :photos
	has_many :quiz_users
	has_many :quizzes, through: :quiz_users
  has_many :received_mails, foreign_key: "receiver_id", class_name: "Email"
  has_many :sent_mails, foreign_key: "sender_id", class_name: "Email", conditions: ["is_drafted = ? AND is_deleted = ?", false, false]
  
	# Setup accessible (or protected) attributes for your model	
	
  
	#Nested attributes
	accepts_nested_attributes_for :user_profile, :photos

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
