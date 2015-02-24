class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :verify_superuser, :only=>:index
  before_filter :verify_owner, :only=>:show

	def index
		@users = User.all.order(:last, :first)
	end

  def show
    @user = User.find(params[:id])
  end

	def destroy
    		@user = User.find(params[:id])
    		@user.destroy

   		 if @user.destroy
   			redirect_to root_url, notice: "User deleted."
  		end
	end

  private

  def verify_superuser
    # assume the route looks like this  /user/:username
    redirect_to books_path unless current_user.is?(:superuser)
  end  

  def verify_owner
    # assume the route looks like this  /user/:username
    redirect_to books_path unless params[:id] == "#{current_user.id}"
  end  

end
