class Bench < ApplicationRecord
  validates :title, :lat, :lon, presence: true
end
