class LinksController < ApplicationController
  before_filter :enforce_logged_in
  def index
    @links = Link.all
  end

  def new
    render :new
  end

  def create
    link = Link.new(link_params)
    link.user_id = current_user.id
    if link.valid?
      link.save!
      redirect_to link_url(link)
    else
      flash[:errors] = "Url can't be blank"
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
    @comments = @link.comments
    render :show
  end

  def update
    link = Link.new(link_params)
    link.user_id = current_user.id
    if link.valid?
      link.save!
      redirect_to link_url(link)
    else
      flash[:errors] = "Please re-enter your link info. They were invalid"
      render :new
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
