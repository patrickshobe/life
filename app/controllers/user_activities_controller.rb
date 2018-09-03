class UserActivitiesController < ApplicationController
  def new
    @user_activity = UserActivity.new
  end

  def create
    UserActivity.create(activity_id: user_activity_params,user_id: current_user.id)
    redirect_to user_path(current_user.id)
  end

  def index
    @activities = UserActivity.where(user_id: current_user.id)
  end

  private

  def user_activity_params
    params.require(:user_activity).permit(:activity_id)
  end
end
