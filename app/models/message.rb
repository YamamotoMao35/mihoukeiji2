class Message < ApplicationRecord
  validates :body, presence: true, length: {maximum: 1000}

  belongs_to :board
end
