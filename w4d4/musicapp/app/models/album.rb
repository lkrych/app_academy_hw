class Album < ActiveRecord::Base
  validates :title, :artist_id, :live, presence: true

  belongs_to :artist
  has_many :tracks
end
