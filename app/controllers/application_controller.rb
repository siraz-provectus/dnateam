class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_login, unless: :devise_controller?
  before_action :check_admin_rights, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :middle_name, :phone, :email, :city, :document])
  end

  def check_login
    return redirect_to new_user_session_url unless user_signed_in?
  end

  def check_admin_rights
    return redirect_to admin_users_url if current_user.admin?
  end
end
