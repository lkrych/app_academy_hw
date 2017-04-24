class Post < ActiveRecord::Base
  validates :title, :author, presence: true
  validates :subs, presence: {message: "must have at least one sub"}

  has_many :postsubs,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: 'Postsub',
    inverse_of: :post,
    dependent: :destroy

  has_many :subs,
    through: :postsubs,
    source: :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
end
