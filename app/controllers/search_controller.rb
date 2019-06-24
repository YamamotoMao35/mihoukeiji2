class SearchController < ApplicationController
  def index
    @board = Board.where('title LIKE(?)', "%#{params[:search]}%").paginate(page: params[:page], per_page: 10).order('created_at ASC')
    @search_title = params[:search]
  end
end
