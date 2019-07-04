class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,except: [:index, :show]

  def index
    @boards = Board.includes(:user).page(params[:page]).per(10).order('created_at ASC')
  end

  def new
    @board = Board.new
  end

  # 書き込み
  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to root_path, notice: "スレッドが作成されました"
    else
      redirect_to new_board_path, alert: "保存ができませんでした。再入力をお願いします。"
    end
  end

  def show
    @messages = @board.messages.limit(1000).page(params[:page]).per(100).order('created_at ASC')
  end

  def edit
  end

  def update
    if @board.user_id == current_user.id
      if @board.update(board_params)
        redirect_to edit_board_path, notice: "スレッド情報を更新しました"
      else
        redirect_to edit_board_path, alert: "スレッド情報の更新に失敗しました"
      end
    else
      redirect_to root_path, alert: "スレッド情報の更新に失敗しました。"
    end
  end

  def destroy
    if @board.user_id == current_user.id
      if @board.destroy
        redirect_to root_path, notice: "スレッドを削除しました"
      else
        redirect_to edit_board_path, alert: "スレッドの削除に失敗しました"
      end
    else
      redirect_to root_path, alert: "スレッドの削除に失敗しました。"
    end
  end

  def category_search
    @categories = Category.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
    render json: @categories
  end

  private
  def board_params
    params.require(:board).permit(:title, :description, category_ids: []).merge(user_id: current_user.id)
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
