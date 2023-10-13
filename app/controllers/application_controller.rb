class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?
  
  def current_user
    @current_user ||= session[:userinfo]
  end

  def logged_in?
    !!current_user
  end
end
