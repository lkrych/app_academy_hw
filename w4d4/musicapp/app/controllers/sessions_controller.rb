class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to cats_url
    else
      render :new
    end
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    return nil if @user.nil?
    if @user.valid?
      log_in!(@user)
      redirect_to user_url(@user)
    else
      redirect_to new_session_url
    end
  end

  def destroy
    log_out!(current_user)
    redirect_to new_session_url
  end
end
