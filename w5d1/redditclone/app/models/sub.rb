class Sub < ActiveRecord::Base
  validates :title, :description, :moderator, presence: true

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :postsubs,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: 'Postsub'

  has_many :posts,
    through: :postsubs,
    source: :post

end
