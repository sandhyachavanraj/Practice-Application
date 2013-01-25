class UserProfile < ActiveRecord::Base
    # attr_accessible :title, :body
    attr_accessible :user_name, :address, :mobile_number, :company, :user_id
    
    # associations
    belongs_to :user
end
