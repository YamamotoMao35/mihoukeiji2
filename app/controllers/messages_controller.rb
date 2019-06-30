class MessagesController < ApplicationController
  def create
    message = Message.create(message_params)
    redirect_to "/boards/#{message.board_id}"
  end

  private
  def message_params
    params.permit(:body, :image, :name, :email, :board_id)
  end
end
