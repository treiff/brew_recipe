class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :oauth_user?, :logged_in_user

  private

  def logged_in_user
    redirect_to login_path unless logged_in?
  end

  def oauth_user?
    current_user.provider == "facebook"
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def sign_in_message
    flash[:notice] = "Signed in successfully"
    redirect_to root_path
  end
end
