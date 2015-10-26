class GoalsController < ApplicationController
  def create
    goal = current_user.goals.new(goal_params)
    flash[:errors] = goal.errors.full_messages unless goal.save
    redirect_to user_url(current_user)
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
    redirect_to user_url(current_user)
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :private)
  end
end
