class UsersController < ApplicationController

  def new
    if current_user
      redirect_to user_url(current_user)
    else
      render :new
    end

  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save!
      login!(@user)
      redirect_to user_path(@user)
    else
      flash.now[:errors] = "Please retry entering email and password"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
