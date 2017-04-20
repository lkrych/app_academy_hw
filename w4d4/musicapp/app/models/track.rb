class Track < ActiveRecord::Base
  validates :name, :album_id, :regular, :lyrics
  belongs_to :band
end
