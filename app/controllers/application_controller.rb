class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :banned?

  def banned?
    if current_user.present? && current_user.banned?
      sign_out current_user
      redirect_to root_url, alert:"This account has been banned. Contact pabookexchange@gmail.com if you have any questions."
    end
  end
  
  helper_method :landing
    protect_from_forgery with: :exception
    before_action :authenticate_user!, :except => [:landing, :terms]
    before_action :configure_permitted_parameters, if: :devise_controller?

  def landing
    if current_user != nil
      redirect_to books_path
    else
      render :layout => false
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first
    devise_parameter_sanitizer.for(:sign_up) << :last
  end
end
