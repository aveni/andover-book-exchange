class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  
  helper_method :landing
    protect_from_forgery with: :exception
    before_action :authenticate_user!, :except => [:landing]
    before_action :configure_permitted_parameters, if: :devise_controller?

  def landing
    render :layout => false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first
    devise_parameter_sanitizer.for(:sign_up) << :last
  end
end
