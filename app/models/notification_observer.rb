class NotificationObserver < ActiveRecord::Observer
	observe :quiz_user
  
	def after_create(quiz_user)
    QuizNotification.welcome_user(quiz_user.user).deliver
  end
end
