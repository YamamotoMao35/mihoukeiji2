class BoardsController < ApplicationController
  
  def index
    @boards = Board.board_list
    @board = Board.new
  end

  def new
  end

  # 書き込み
  def create
    @board = Board.new(params.require(:board).permit(:title))
    if @board.save
      redirect_to action: :index
    else
      @boards = Board.board_list
      render :index
    end
  end

end
