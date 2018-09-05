class UsersController < ApplicationController
  def new
    @user = User.new
  end

   def show
    @user = User.find(params[:id])
    @points = @user.activities.sum(:points)
    @level = Level.find_by("#{@points} between min_score and max_score")
    @progress = ((@points.to_f / @level.max_score) * 100).round(2).to_s + '%'
   end


  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
