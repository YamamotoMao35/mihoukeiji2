class Board < ApplicationRecord
  validates :title, presence: true, length: {maximum: 60}

  def self.board_list
    return Board.all.order("created_at ASC")
  end

  has_many :board_classifications
  has_many :categories, through: :board_classifications
end
