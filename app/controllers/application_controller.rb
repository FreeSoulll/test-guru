class ApplicationController < ActionController::Base
  helper FlashHelper
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      set_current_url_cookie
      return redirect_to login_path, alert: 'Are you Guru? Verify your Email and Password'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def set_current_url_cookie
    cookies[:request_url] = request.original_url
  end
end
