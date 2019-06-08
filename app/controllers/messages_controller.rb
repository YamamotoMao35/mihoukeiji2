class MessagesController < ApplicationController
  def create
    message = Message.create(body: message_params[:body], board_id: message_params[:board_id])
    redirect_to "/boards/#{message.board_id}"
  end

  private
  def message_params
    params.permit(:body, :board_id)
  end
end
