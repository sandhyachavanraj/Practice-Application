class Email < ActiveRecord::Base
  # attr_accessible :title, :body
  
  attr_accessible :name, :sender_id, :receiver_id, :subject, :body, :sent_at
  
  belongs_to :user
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'

 scope :drafted, where(is_drafted: true)
 scope :trashed, where(is_deleted: true)
 scope :not_drafted_deleted_emails, where('is_drafted = ? AND is_deleted = ?', false, false)
#  scope :unread, conditions: ["read_at IS NULL"]
#  scope :read, conditions: ["read_at IS NOT NULL"]
end
