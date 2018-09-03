class Admin::ActivitiesController < Admin::BaseController
  def show
    @activity = Activity.find(params[:id])
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def destroy
    @activity = Activity.find(params[:id])
    Activity.destroy(@activity.id)
    flash.notice = "Activity #{@activity.title} Deleted"
    redirect_to admin_activities_path
  end

  def index
    @activities = Activity.all
  end
end
