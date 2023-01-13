class ImageSet < ApplicationRecord
  validates :typ, presence: true
  validates :color, presence: true
  belongs_to :map
  has_many :images
end
