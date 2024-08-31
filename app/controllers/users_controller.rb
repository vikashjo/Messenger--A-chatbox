class UsersController < ApplicationController
  def index
    @users = User.all
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

  def update
    
    if @user.update(user_params)
      flash[:notice] = "User updated successfully"

    else
      render 'new'
    end
  end

  private

  def user_params
    params.permit(:user).require(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
