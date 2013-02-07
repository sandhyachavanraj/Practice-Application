class UserProfile < ActiveRecord::Base
    # attr_accessible :title, :body
    attr_accessible :user_name, :address, :mobile_number, :company, :user_id
    
    # associations
    belongs_to :user

    # validations

    validates :user_name, presence: true, format: {with: /^([a-zA-Z\s0-9]*)$/, message: "username contains characters and numbers"}
    validates :address, presence: true
    validates :company, presence: true
    validates :mobile_number, length: {is: 10, allow_blank: true }
    validates :mobile_number, presence: true, uniqueness: true, numericality: true
    #validates :mobile_number, numericality: {greater_than: 7, less_than: 10}, uniqueness: true, :unless => Proc.new{|u| u.mobile_number.blank? } 
    #, length: {:in => 8..10, allow_blank: true}, uniqueness: true, numericality: true
end
