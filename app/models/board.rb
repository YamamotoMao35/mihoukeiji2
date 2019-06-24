class Board < ApplicationRecord
  validates :title, presence: true, length: {maximum: 60}
  validates :description, presence: true, length: {maximum: 1000}
  validates :categories, presence: true

  has_many :messages
  has_many :board_classifications
  has_many :categories, through: :board_classifications
end
