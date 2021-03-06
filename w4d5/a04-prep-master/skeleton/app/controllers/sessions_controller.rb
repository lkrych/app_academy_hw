class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      flash.now[:errors] = "Url can't be blank"
      render :new
    else
      login!(@user)
      redirect_to links_url
    end
  end

  def destroy
    logout!(current_user)
    redirect_to new_session_url
  end
end
