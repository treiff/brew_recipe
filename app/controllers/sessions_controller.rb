class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:provider] == "facebook"
      user = User.from_omniauth(env["omniauth.auth"])
      log_in(user)
      redirect_to root_path
    else
      user = User.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to root_path
      else
        render 'new'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
