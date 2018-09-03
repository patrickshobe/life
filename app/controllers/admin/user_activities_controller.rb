class Admin::UserActivitiesController < Admin::BaseController
  def new
    @user_activity = UserActivity.new
  end

  def index
    @activities = UserActivity.all
  end
end
