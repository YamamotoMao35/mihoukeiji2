class SearchController < ApplicationController
  def index
    @board = Board.includes(:user).where('title LIKE(?)', "%#{params[:search]}%").page(params[:page]).per(10).order('created_at ASC')
    @search_title = params[:search]
  end
end
