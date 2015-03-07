class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :verify_admin_superuser, :only=>:index
  before_filter :verify_owner, :only=>:show

	def index
		@users = User.all.order(:last, :first)
	end

  def show
    @user = User.find(params[:id])
  end

  def ban
    @user = User.find(params[:user_id])
    @user.banned = true
    @user.save
    redirect_to users_path, alert: "User banned."
  end

  def unban
    @user = User.find(params[:user_id])
    @user.banned = false
    @user.save
    redirect_to users_path, notice: "User unbanned."
  end

  private

  def verify_admin_superuser
    # assume the route looks like this  /user/:username
    redirect_to books_path unless current_user.is?(:superuser) || current_user.is?(:admin)
  end  

  def verify_owner
    # assume the route looks like this  /user/:username
    redirect_to books_path unless current_user.is?(:superuser) || current_user.is?(:admin) || params[:id] == "#{current_user.id}"
  end  

end
