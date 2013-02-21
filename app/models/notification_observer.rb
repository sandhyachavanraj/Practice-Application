class NotificationObserver < ActiveRecord::Observer
	observe :quiz_user
  
	def after_create(quiz_user)
  end
end
