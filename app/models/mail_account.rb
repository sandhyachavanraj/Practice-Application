# Copyright@plasticsurgeryfriends.org
#require 'contacts'

class MailAccount
  GMAIL = 'gmail'
  YAHOOMAIL = "yahoo"
  HOTMAIL = 'hotmail'

  attr_accessor :login
  attr_accessor :password
  attr_accessor :mail_type

  def update_attributes(arr_params)
    @login = arr_params[:login]
    @password = arr_params[:password]
    @mail_type = arr_params[:mail_type]
    self
  end

#  def initialize
#
#  end

  def contacts
    case @mail_type
    when MailAccount::GMAIL
      Contacts::Gmail.new(@login, @password).contacts
    when MailAccount::YAHOOMAIL
      Contacts::Yahoo.new(@login, @password).contacts
    when  MailAccount::HOTMAIL
      Contacts::Hotmail.new(@login, @password).contacts
    else
      []
    end
  end
end