class Board < ApplicationRecord
  validates :title, presence: true, length: {maximum: 60}
  validates :description, presence: true, length: {maximum: 1000}
  validates :categories, presence: true

  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :board_classifications, dependent: :destroy
  has_many :categories, through: :board_classifications
end
