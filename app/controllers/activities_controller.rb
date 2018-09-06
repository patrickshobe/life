class ActivitiesController < ApplicationController
  before_action :require_user, only: [:show, :index]


  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end
  private
  def require_user
    render file: "/public/404" unless current_user
  end

end
