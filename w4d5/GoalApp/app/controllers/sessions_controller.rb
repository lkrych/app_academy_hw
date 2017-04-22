class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      session[:session_token] = user.session_token
      redirect_to user_url(user)
    else
      flash.now[:errors] = "Email or Password invalid"
      render :new
    end
  end

  def destroy
    logout!(current_user)
    redirect_to :new
  end

end
