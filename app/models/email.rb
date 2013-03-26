class Email < ActiveRecord::Base
  # attr_accessible :title, :body

#  paginates_per 10

  self.per_page = 10
  
  attr_accessible :name, :sender_id, :receiver_id, :subject, :body, :sent_at, :attachemnt_attributes
  
  belongs_to :user
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'
  has_many :attachments

 scope :drafted, where(is_drafted: true)
 scope :trashed, where(is_deleted: true)
 scope :not_drafted_deleted_emails, where('is_drafted = ? AND is_deleted = ?', false, false)
#  scope :unread, conditions: ["read_at IS NULL"]
#  scope :read, conditions: ["read_at IS NOT NULL"]


  accepts_nested_attributes_for :attachments
end
