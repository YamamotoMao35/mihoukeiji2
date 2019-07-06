class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    if message.save
      if user_signed_in?
        user_id = current_user.id
        message_user = Message.find(message.id)
        message_user.update(user_id: user_id)
        redirect_to "/boards/#{message.board_id}", notice: "レスを投稿しました"
      else
        redirect_to "/boards/#{message.board_id}", notice: "レスを投稿しました"
      end
    else
      redirect_to "/boards/#{message.board_id}", alert: "レスを投稿できませんでした。"
    end
  end

  private
  def message_params
    params.permit(:body, :image, :name, :email, :board_id)
  end
end
