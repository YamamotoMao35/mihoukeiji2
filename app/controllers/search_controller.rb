class SearchController < ApplicationController
  def index
    @board = Board.where('title LIKE(?)', "%#{params[:search]}%")
    @search_title = params[:search]
  end
end
