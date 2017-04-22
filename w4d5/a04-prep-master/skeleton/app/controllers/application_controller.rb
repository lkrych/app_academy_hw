class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.session_token
  end

  def logout!(user)
    session[:session_token] = nil
    user.reset_session_token!
  end

  def logged_in
    !!current_user
  end

  def enforce_logged_in
    if logged_in
      true
    else
      redirect_to new_session_url
    end
  end
end
