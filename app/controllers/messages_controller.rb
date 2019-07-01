class MessagesController < ApplicationController
  def create
    message = Message.create(message_params)
    redirect_to "/boards/#{message.board_id}", notice: "レスを投稿しました"
  end

  private
  def message_params
    params.permit(:body, :image, :name, :email, :board_id)
  end
end
