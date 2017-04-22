class Link < ActiveRecord::Base
  validates :title, :url, :user, presence: true

  belongs_to :user

  has_many :comments,
    primary_key: :id,
    foreign_key: :link_id
end
