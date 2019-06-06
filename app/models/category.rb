class Category < ApplicationRecord
  has_many :board_classifications
  has_many :boards, through: :board_classifications
end
