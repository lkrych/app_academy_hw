class CommentsController < ApplicationController
  before_filter :enforce_login

  def create
    @comment = Comment.new(comment_params)
    unless @comment.save
      flash[:errors] = "Body can't be blank"
    end
    redirect_to link_url(@comment.link)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to link_url(@comment.link)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :link_id, :user_id)
  end
end
