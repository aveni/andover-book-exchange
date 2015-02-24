class UsersController < ApplicationController

	def index
		@users = User.all.order(:last, :first)
	end

      def show
            @user = User.find(current_user.id)
      end

	def destroy
    		@user = User.find(params[:id])
    		@user.destroy

   		 if @user.destroy
     			redirect_to root_url, notice: "User deleted."
    		end
  	end
end
