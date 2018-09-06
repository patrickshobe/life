class UsersController < ApplicationController
  before_action :require_user, only: [:show, :index]

  def new
    @user = User.new
  end

  def index
    @users = User.all
    @users = @users.sort_by {|user| - user.points }

  end

   def show
    @user = User.find(params[:id])
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

    def require_user
      render file: "/public/404" unless current_user
    end
end
