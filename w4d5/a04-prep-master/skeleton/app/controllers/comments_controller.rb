class CommentsController < ApplicationController
  before_filter :enforce_log_in

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    if comment.valid?
      comment.save!
      redirect_to link_url(comment.link_id)
    else
      flash[:errors] = "Please re-enter your information"
      redirect_to link_url(comment.link_id)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to link_url(comment.link_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end
end
