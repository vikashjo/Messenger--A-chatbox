class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :create, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
    else
      render 'new'
    end
  end

  def edit 
  end

  def update
    
    if @user.update(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to user_by_username_path(username: @user.username)
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = User.find_by(username: params[:username])
  end
end
