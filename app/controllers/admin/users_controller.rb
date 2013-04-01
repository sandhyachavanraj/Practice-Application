class Admin::UsersController < ApplicationController

  def invite_friends
    @user = User.find(params[:id])
  end

  def friends
    @user = User.find(params[:id])
    begin
      @sites = {"gmail"  => Contacts::Gmail, "yahoo" => Contacts::Yahoo, "hotmail" => Contacts::Hotmail}
      @contacts = @sites[params[:user][:mail_type]].new(params[:user][:email], params[:user][:password]).contacts
      respond_to do |format|
        format.html {render :template => 'admin/users/_contact_list', :layout => false}
        format.xml {render :xml => @contacts.to_xml}
      end
    end
  end
end
