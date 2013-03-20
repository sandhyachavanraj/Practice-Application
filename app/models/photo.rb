class Photo < ActiveRecord::Base
  attr_accessible :user_id, :photo
  
  belongs_to :user
  
  has_attached_file :photo, styles: {thumb: "50x50#"}
end
