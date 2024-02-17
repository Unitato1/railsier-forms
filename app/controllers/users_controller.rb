class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_parms)

    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def index
    @users = User.all
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])

    if @user.update(user_parms)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private
  def user_parms
    params.require(:user).permit(:username, :password, :email)
  end
end
