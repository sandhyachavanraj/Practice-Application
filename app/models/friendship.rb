class Friendship < ActiveRecord::Base
  attr_accessible :accepted_at, :created_at, :friend_id, :user_id

  belongs_to :friendshipped_by_me,   :foreign_key => "user_id",   :class_name => "User"
  belongs_to :friendshipped_for_me,  :foreign_key => "friend_id", :class_name => "User"
end