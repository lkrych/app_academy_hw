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
    if @user.valid?
      login!(@user)
      redirect_to user_url(@user)
    else
      redirect_to new_sessions_url
    end
  end

  def destroy
    logout!(current_user)
    redirect_to new_sessions_url
  end
end
