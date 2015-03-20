class SessionsController < Devise::SessionsController

protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.banned?
    	sign_out current_user
    	redirect_to root_url, alert:"This account has been banned. Contact pabookexchange@gmail.com if you have any questions."
    else
      super
    end
   end

end