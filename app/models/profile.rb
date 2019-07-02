class Profile < ApplicationRecord
  belongs_to :user
  validates :self_introduction, length: {maximum: 120}
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
