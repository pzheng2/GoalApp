class CheersController < ApplicationController

  def create
    cheer = current_user.cheers.new(goal_id: params[:cheer][:goal_id])
    if cheer.goal.user == current_user
      flash[:errors] = ["Cannot cheer your own goal."]
    else
      flash[:errors] = cheer.errors.full_messages unless cheer.save
    end
    redirect_to user_url(cheer.goal.user)
  end

  def destroy
    cheer = Cheer.find(params[:id])
    cheer.destroy
    redirect_to user_url(cheer.goal.user)
  end

end
