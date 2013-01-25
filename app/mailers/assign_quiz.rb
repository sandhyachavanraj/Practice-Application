class AssignQuiz < ActionMailer::Base
  default :from => "sandhya.karanam@sumerusolutions.com"

  def welcome_user(user)
    @user = user
    mail(:to => "#{@user_name} <#{@user.email}>", :subject => "AssignQuiz")
  end

end
