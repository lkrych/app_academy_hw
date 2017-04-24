class PostsController < ApplicationController
  before_filter :enforce_login

  def new
    @post = Post.new
    @subs = Sub.all
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post_url(post)
    else
      flash[:errors] = "Sorry there was something wrong with your submission, please try again."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = current_user.posts.find(params[:id])
    if post.update_attributes(post_params)
      redirect_to post_url(post)
    else
      flash[:errors] = "Sorry there was something wrong with your submission, please try again."
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, sub_ids: [])
  end
end
