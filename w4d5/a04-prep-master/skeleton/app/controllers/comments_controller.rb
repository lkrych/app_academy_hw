class CommentsController < ApplicationController
  before_filter :enforce_logged_in
  def new
    render :new
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.link_id = params[:id]
    if comment.valid?
      comment.save!
      redirect_to link_url(comment.link_id)
    else
      flash[:errors] = "Please re-enter your link info. They were invalid"
      render :new
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
