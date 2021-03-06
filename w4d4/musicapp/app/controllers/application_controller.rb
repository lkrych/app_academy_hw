class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    return nil if current_user.nil?
    session[:session_token] == current_user.session_token
  end

  def log_in!(user)
    session[:session_token] = user.session_token
  end

  def log_out!(user)
    if current_user
      user.reset_session_token!
      session[:session_token] = nil
    end
  end

end
