class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save!
      login!(user)
      redirect_to links_url
    else
      flash[:errors] = "Please try again, your entry was invalid"
      render :new
    end
  end


  private

  def user?
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
