class SubsController < ApplicationController

  def index
    @subs = Sub.all
    @subs = Sub.new if @subs.nil?
  end
  def new
    @sub = Sub.new
  end

  def create
    s = Sub.new(sub_params)
    s.user_id = current_user.id
    if s.save
      redirect_to sub_url(s)
    else
      flash[:errors] = "Sorry there was something wrong with your submission"
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    enforce_login
    @sub = Sub.find(params[:id])
  end

  def update
    enforce_login
    s = current_user.subs.find(params[:id])
    if s.update_attributes(sub_params)
      redirect_to sub_url(s)
    else
      flash[:errors] = "Sorry there was something wrong with your submission"
      render :new
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
