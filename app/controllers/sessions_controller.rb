class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:provider] == "facebook"
      user = User.from_omniauth(env["omniauth.auth"])
      log_in(user)
      sign_in_message
    else
      user = User.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        sign_in_message
      else
        flash.now[:error] = "Username/Password invalid"
        render 'new'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out successfully"
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
