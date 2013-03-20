class NewsletterMailer < ActionMailer::Base
  default from: "karanam.sandhya121@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.weekly.subject
  #
  

def weekly(email)
  mail to: email, subject: "RailsCasts Weekly"
end


end




