class GoalCommentsController < ApplicationController

  def create
    comment = current_user.goal_comments.new(goal_comment_params)
    unless comment.save
      flash[:errors] = comment.errors.full_messages
    end
    redirect_to user_url(comment.goal.user)
  end

  def destroy
    comment = GoalComment.find(params[:id])
    comment.destroy
    redirect_to user_url(comment.goal.user)
  end

  def goal_comment_params
    params.require(:goal_comment).permit(:body, :goal_id)
  end
end
