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
end
