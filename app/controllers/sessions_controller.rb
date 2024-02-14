class SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!, only: %i[new create logut]
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to cookies[:request_url] || root_path
    else
      flash.now[:alert] = 'Are you guru? Verify your Email and Password please'
      render :new
    end
  end

  def logout
    reset_session
    redirect_to login_path
  end
end
