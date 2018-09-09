class Admin::UserActivitiesController < Admin::BaseController
  def new
    @user_activity = UserActivity.new
  end

  def index
    @activities = UserActivity.all
  end

  def show
    @activity = UserActivity.find(params[:id])
  end

  def edit
    @activity = UserActivity.find(params[:id])
  end

  def destroy
    activity = UserActivity.find(params[:id])
    UserActivity.destroy(activity.id)
    redirect_to admin_user_activities_path
  end
end
