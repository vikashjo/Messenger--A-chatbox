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
      session[:user_id] = @user.id
      flash[:notice] = "User created successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit 
  end

  def update
    
    if @user.update(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "User account deleted successfully"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
