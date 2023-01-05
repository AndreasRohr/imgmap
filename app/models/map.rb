class Map < ApplicationRecord
  validates :title, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :zoom, presence: true
end
