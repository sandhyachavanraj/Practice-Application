class UserMailer < ActionMailer::Base
#  default from: "karanam.sandhya121@gmail.com"
  
  def send_mail(email)
    @email = email
    mail(to: email.receiver.email, subject: email.subject)
  end
end
