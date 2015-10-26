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

  def edit
    @goal = Goal.find(params[:id])

  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to user_url(@goal.user)
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :private, :completed)
  end

end
