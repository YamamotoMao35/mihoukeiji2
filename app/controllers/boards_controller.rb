class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update]
  before_action :move_to_index,except: [:index, :show]

  def index
    @boards = Board.paginate(page: params[:page], per_page: 10).order('created_at ASC')
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
      redirect_to new_board_path
    end
  end

  def show
    @messages = @board.messages
  end

  def update
    @board.update(board_params)
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
