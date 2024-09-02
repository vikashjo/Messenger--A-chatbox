class ChatroomController < ApplicationController

  def index
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.find_by(id: params[:id])
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = Chatroom.all
    render 'index'
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
