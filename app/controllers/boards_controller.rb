class BoardsController < ApplicationController
  
  def index
    @boards = Board.paginate(page: params[:page], per_page: 5).order('created_at ASC')
  end

  def new
    @board = Board.new
  end

  # 書き込み
  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to action: :index
    else
      @boards = Board.paginate(page: params[:page], per_page: 5).order('created_at ASC')
      render :index
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  private
  def board_params
    params.permit(:title)
  end

end
