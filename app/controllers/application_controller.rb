class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_logined?

  def after_sign_in_path_for(user)
    admin_tests_path
  end

  private

  def user_logined?
    cookies.delete(:first_reffer) unless user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def set_current_url_cookie
    cookies[:request_url] = request.original_url
  end
end
