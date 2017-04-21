class AlbumsController < ApplicationController
  def new
    @bands = current_user.bands
    render :new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

end
