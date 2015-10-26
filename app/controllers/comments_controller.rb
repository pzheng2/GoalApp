class CommentsController < ApplicationController
  def create
    comment = current_user.comments.new(comment_params)
    unless comment.save
      flash[:errors] = comment.errors.full_messages
    end
    redirect_to_owner(comment)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to_owner(comment)
  end

  private

  def redirect_to_owner(comment)
    if comment.commentable_type == "User"
      redirect_to user_url(comment.commentable)
    else
      redirect_to user_url(comment.commentable.user)
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end

end
