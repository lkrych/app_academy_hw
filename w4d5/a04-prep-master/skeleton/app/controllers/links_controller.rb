class LinksController < ApplicationController
  before_filter :enforce_log_in

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    link = Link.new(link_params)
    link.user_id = current_user.id
    if link.valid?
      link.save!
      redirect_to link_url(link.id)
    else
      flash[:errors] = "Url can't be blank"
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    link = Link.new(link_params)
    link.user_id = current_user.id

    link.save!
    redirect_to link_url(link)
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
