class UserMailer < ActionMailer::Base
  default from: "karanam.sandhya121@gmail.com"
  
  def send_mail(email, sub)
    @email = sub
    mail(to: email, subject: sub.subject)
  end
end
