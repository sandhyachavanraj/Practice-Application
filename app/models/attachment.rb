class Attachment < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :email_id, :file_name, :content_type, :file_size, :attachment
  belongs_to :email
  has_attached_file :attachment, styles: {thumb: "50x50#"}
end
