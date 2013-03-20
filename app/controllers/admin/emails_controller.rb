class Admin::EmailsController < ApplicationController
  def index
    @emails = current_user.received_mails.not_drafted_deleted_emails
  end
  
  def new
    @email = Email.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    if params[:email] != nil
      @email = Email.new(params[:email])
      receiver_mail = params[:email][:receiver_id]
      @email.receiver_id = User.find_by_email(receiver_mail).id
      @email.sender_id = current_user.id
      @email.name = User.find(@email.sender_id).user_profile.user_name
      @email.sent_at = Time.now
      if @email.save!
        UserMailer.send_mail(@email).deliver
        flash[:notice] = "Mail sent"
        redirect_to admin_emails_path
      else
        flash[:notice] = "There's an error while sending"
        render new_admin_email_path
      end
    else
      @email = Email.new
      receiver_id = User.find_by_email(params[:receiver_id])
      @email.receiver_id = receiver_id
      @email.sender_id = current_user.id
      @email.name = User.find(@email.sender_id).user_profile.user_name
      @email.is_drafted = true
      @email.body = params[:body]
      @email.subject = params[:subject]
      if @email.save
        flash[:notice] = "Mail saved to drafts"
        respond_to do |format|
          format.js {render :js => "window.location.replace('#{admin_emails_path}');" }
        end
      end
    end
  end
  
  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      #      format.html
      format.js
    end
  end
  
  def reply_email
    @email = Email.find(params[:id])    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def send_reply
    @email = Email.find(params[:id])
    receiver_email = params[:email][:receiver_id]
    @email.receiver_id = User.find_by_email(receiver_email).id
    UserMailer.send_mail(@email).deliver
    if @email.save
      flash[:notice] = "mail sent"
      redirect_to admin_emails_path
    end
  end
  
  def forward_email
    @email = Email.find(params[:id])
  end
  
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    flash[:notice] = "successfully deleted"
    redirect_to admin_emails_path
  end
  
  def delete_multiple
    @emails = Email.where("id in (?)", params[:id].split(','))
    @emails.each do |mail|
      mail.is_deleted = true
      mail.save
    end
#    Email.where("id in (?)", params[:id].split(',')).destroy_all
    respond_to do |format|
      format.js {render :js => "window.location.replace('#{admin_emails_path}');" }
    end
  end

  def sent_mail
    @sent_mails = current_user.sent_mails
  end

  def drafts
    @emails = Email.drafted.where(:sender_id => current_user.id)
  end

  def trashed
    @emails = Email.trashed.where(:sender_id => current_user.id)
  end

  def read_unread
    @email = Email.find(params[:id])
    if @email.read_at == nil
      @email.read_at = Time.now
    else
      @email.read_at = nil
    end
    @email.save
    respond_to do |format|
      format.js {render :js => "window.location.replace('#{admin_emails_path}');" }
    end
  end
  
end
