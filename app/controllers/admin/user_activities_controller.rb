class Admin::UserActivitiesController < Admin::BaseController
  def new
    @user_activity = UserActivity.new
  end
end
