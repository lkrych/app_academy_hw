class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = "Invalid username or password"
      render :new
    else
      sign_in(user)
      redirect_to links_url
    end
  end

  def destroy
    sign_out(current_user)
    redirect_to new_session_url
  end


end
