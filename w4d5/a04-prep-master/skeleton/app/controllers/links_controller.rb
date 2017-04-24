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
    if @link.valid?
      @link.save!
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
    if @link.update_attributes(link_params)
      @link.save
    else
      flash[:errors] = "Url can't be blank"
    end
    redirect_to link_url(@link)
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_url
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
