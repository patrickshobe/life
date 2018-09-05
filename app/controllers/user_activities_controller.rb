class UserActivitiesController < ApplicationController
  def new
    @user_activity = UserActivity.new
  end

  def create
    UserActivity.create(activity_id: user_activity_params[:activity_id],user_id: current_user.id)
    current_user.update_level
    redirect_to user_path(current_user.id)
  end

  def index
    @activities = UserActivity.where(user_id: current_user.id)
  end

  def destroy
    UserActivity.destroy(params[:id])
    redirect_to user_activities_path
  end

  private

  def user_activity_params
    params.require(:user_activity).permit(:activity_id)
  end
end
