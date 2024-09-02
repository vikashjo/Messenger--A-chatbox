class MessagesController < ApplicationController

  before_action :require_user

  def index
    @messages = Message.all
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.save
      redirect_to request.referrer
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:body, :chatroom_id)
  end
end
