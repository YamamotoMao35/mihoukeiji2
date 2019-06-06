class Board < ApplicationRecord
  validates :title, presence: true, length: {maximum: 60}
end
