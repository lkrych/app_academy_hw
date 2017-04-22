class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    if logged_in?
      render :new
    else
      redirect_to new_session_url
    end
  end

  def create
    if logged_in?
      link = Link.new(link_params)
      if link.valid?
        link.save!
        redirect_to link_url(link.id)
      else
        flash[:errors] = "Please try again, your entry was invalid"
        render new_session_url
      end
    else
      redirect_to new_session_url
    end
  end

  def show
    if logged_in?
      @link = Link.find(params[:id])
      render :show
    else
      redirect_to new_session_url
    end
  end

  def update
    if logged_in?
      render :edit
    else
      redirect_to new_session_url
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :user, :user_id, :comment)
  end
end
