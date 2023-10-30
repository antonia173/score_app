class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?
  helper_method :require_user

  def current_user
    @current_user ||= User.find_by(email: session["userinfo"]["name"]) if session[:userinfo]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
