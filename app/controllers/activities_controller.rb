class ActivitiesController < ApplicationController
  before_action :require_user, only: [:show, :index]


  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def update
    activity = Activity.find(params[:id])
    activity.update(activity_params)
    redirect_to admin_activity_path(activity)
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :category, :points)
  end
  def require_user
    render file: "/public/404" unless current_user
  end

end
