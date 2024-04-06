class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :alert
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :delete_timer_cookie

  def after_sign_in_path_for(user)
    return admin_tests_path if user.admin?

    flash[:alert] = "Привет, #{user.email}!"
    tests_path
  end

  def default_url_options
    I18n.locale.to_s == I18n.default_locale.to_s ? { lang: nil } : { lang: I18n.locale }
  end

  private

  def delete_timer_cookie
    cookies.delete(:timer) unless params[:controller] == 'test_passages'
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang])? params[:lang] : I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def set_current_url_cookie
    cookies[:request_url] = request.original_url
  end
end
