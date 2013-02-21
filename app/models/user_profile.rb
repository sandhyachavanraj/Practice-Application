class UserProfile < ActiveRecord::Base
    # attr_accessible 
    attr_accessible :user_name, :address, :mobile_number, :company, :user_id
    
    # associations
    belongs_to :user

    # validations
    validates :user_name, presence: true, format: {with: /^([a-zA-Z]*)$/, message: "username contains only characters"}
    validates :address, presence: true
    validates :company, presence: true
    validates :mobile_number, length: {is: 10, allow_blank: true }
    validates :mobile_number, presence: true, uniqueness: true, numericality: true    
end
