class Board < ApplicationRecord
  validates :title, presence: true, length: {maximum: 60}

  has_many :board_classifications
  has_many :categories, through: :board_classifications
end
