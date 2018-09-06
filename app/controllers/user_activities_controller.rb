class UserActivitiesController < ApplicationController
  def new
    @user_activity = UserActivity.new
  end

  def create
    if UserActivity.valid(user_activity_params, current_user)
      UserActivity.create(activity_id: user_activity_params[:activity_id],user_id: current_user.id)
      redirect_to user_path(current_user.id)
    else
      redirect_to new_user_activity_path
      flash.notice = "You can only do that once a day"
    end
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
