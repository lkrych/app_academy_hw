class CommentsController < ApplicationController
  def create
    if logged_in?
      comment = Comment.new(comments_params)
      if comment.valid?
        comment.save
        redirect_to link_url(comment.link_id)
      else
        flash[:error] = "I'm sorry but your input was invalid"
        redirect_to links_url
      end
    else
      redirect_to new_session_url
    end
  end

  def destroy
    if logged_in?
      comment = Comment.find_by(params[:id])
      comment.destroy!
      redirect_to link_url(comment.link_id)
    else
      redirect_to new_session_url
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :user_id, :link_id, :user, :link)
  end
end
