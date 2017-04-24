class Post < ActiveRecord::Base
  validates :title, :sub, :author, presence: true

  has_many :postsubs,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: 'Postsub'

  has_many :subs,
    through: :postsubs,
    source: :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
end
