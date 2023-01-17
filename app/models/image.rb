class Image < ApplicationRecord
  belongs_to :image_set
  has_many_attached :source
end
