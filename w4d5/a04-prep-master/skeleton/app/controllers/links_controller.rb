class LinksController < ApplicationController
  before_filter :enforce_login

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = "Url can't be blank"
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])
    @link.user_id = current_user.id
    if @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash[:errors] = "Url can't be blank"
      render :edit
    end
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end

end
