class Bench < ApplicationRecord
  validates :description, :lat, :lon, presence: true
end
