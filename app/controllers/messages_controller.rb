class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    if message.save
      redirect_to "/boards/#{message.board_id}", notice: "レスを投稿しました"
    else
      redirect_to "/boards/#{message.board_id}", alert: "レスを投稿できませんでした。"
    end
  end

  private
  def message_params
    params.permit(:body, :image, :name, :email, :board_id)
  end
end
