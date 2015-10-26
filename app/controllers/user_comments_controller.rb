class UserCommentsController < ApplicationController

  def create
    comment = current_user.user_comments.new(user_comment_params)
    unless comment.save
      flash[:errors] = comment.errors.full_messages
    end
    redirect_to user_url(comment.user)
  end

  def destroy
    comment = UserComment.find(params[:id])
    comment.destroy
    redirect_to user_url(comment.user)
  end

  def user_comment_params
    params.require(:user_comment).permit(:body, :user_id)
  end

end
