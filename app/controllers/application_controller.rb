class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    return admin_tests_path if user.admin?

    flash[:notice] = "Привет, #{user.first_name} #{user.last_name}!"
    tests_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def set_current_url_cookie
    cookies[:request_url] = request.original_url
  end
end
