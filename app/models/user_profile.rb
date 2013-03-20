class UserProfile < ActiveRecord::Base
    # attr_accessible :title, :body
    attr_accessible :user_name, :address, :mobile_number, :company, :user_id, :photo
    
    # associations
    belongs_to :user
    
  
    
#  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
