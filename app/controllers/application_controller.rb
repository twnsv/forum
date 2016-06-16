class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :info, :warning

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :passwor_confirmation) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :passwor_confirmation, :current_password) }
  end
end
