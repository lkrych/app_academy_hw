class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to subs_url
    else
      flash[:errors] = "Sorry, your credentials were incorrect, please try again."
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
