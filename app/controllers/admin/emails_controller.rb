class Admin::EmailsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
#    @emails = Kaminari.paginate_array(current_user.received_mails.not_drafted_deleted_emails).page(params[:page]).per(params[:per_page] || 10)

    @emails = current_user.received_mails.not_drafted_deleted_emails.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => params[:per_page] || 10)
  end
  
  def new
    @email = Email.new
    @email.attachments.build
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
#    raise params.inspect
    if params[:email] != nil
      @email = Email.new(params[:email])
      receiver_mails = params[:email][:receiver_id].split(",")
      receiver_mails.each do |receiver_mail|
        @email.receiver_id = User.find_by_email(receiver_mail).id
        @email.sender_id = current_user.id
        @email.name = User.find(@email.sender_id).user_profile.user_name
        @email.sent_at = Time.now
        @email.save
        UserMailer.send_mail(receiver_mail, @email).deliver
      end

      if @email.save
#        user = User.find(@email.receiver_id)
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
      @email.sent_at = Time.now
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
    @email.read_at = Time.now
    @email.save
    respond_to do |format|
      #      format.html
      format.js
      format.pdf do
        render :pdf => "show"
      end
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
    @email.subject = params[:email][:subject]
    @email.body = params[:email][:body]
    @email.sender_id = current_user.id
#    user = User.find_by_email(receiver_email)
    if @email.save
      UserMailer.send_mail(receiver_email, @email).deliver
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
    @emails = current_user.sent_mails.paginate(:page => params[:page], :per_page => params[:per_page] || 10)
  end

  def drafts
    @emails = Email.drafted.where(:sender_id => current_user.id).paginate(:page => params[:page], :per_page => params[:per_page] || 10)
  end

  def trashed
    @emails = Email.trashed.where(:sender_id => current_user.id).paginate(:page => params[:page], :per_page => params[:per_page] || 10)
  end

  def read_unread
    @email = Email.find(params[:id])
    if @email.read_at == nil
      @email.read_at = Time.now
    else
      @email.read_at = nil
    end
    @email.save
#     render :partial => 'list_emails'
    respond_to do |format|
      format.js {render :js => "window.location.replace('#{admin_emails_path}');" }
    end
  end

  def search_email
    @emails = Email.where('name = ?', params[:name]).paginate(:page => params[:page], :per_page => params[:per_page] || 10)
    respond_to do |format|
      format.html
      format.js
    end
    #    respond_to do |format|
    #      format.js { render :js => "window.location.replace('#{admin_emails_path}');" }
    #    end

  end

#  def display_emails
#    limit = params[:number]
#    session[:limit] = limit
#    @emails = current_user.received_mails.not_drafted_deleted_emails.paginate(:page => params[:page], :per_page => params[:number]||10)
#    respond_to do |format|
#      format.html
#      format.js
#    end
#  end

  def print
    @email = Email.find(params[:id])
  end

  def invite_friends
    
    raise "sandhya".inspect
  end

  def friends
    raise "friends".inspect
  end

  def sort
    
  end

  private

  def sort_column
#    params[:sort] || "sender_id"
    Email.column_names.include?(params[:sort]) ? params[:sort] : "sender_id"
  end

  def sort_direction
#    params[:direction] || "asc"
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
