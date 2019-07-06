class Message < ApplicationRecord
  validates :body, presence: true, length: {maximum: 1000}
  validates :name, length: { maximum: 10 }

  belongs_to :board
  belongs_to :user, optional: true
  has_one_attached :image

  private

    def image_type
      if images.each do |image|
        if !image.content_type.in?(%('image/jpg image/jpeg image/png'))
          errors.add(:images, 'needs to be a JPG or JPEG or PNG')
        end
      end
    end
  end
end
