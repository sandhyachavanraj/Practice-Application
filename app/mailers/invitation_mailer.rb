class InvitationMailer < ActionMailer::Base
  default from: "karanam.sandhya121@gmail.com"

  def invite(email)
    mail to: email, subject: "Welcome To CSF"
  end
end
