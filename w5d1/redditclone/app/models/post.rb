class Post < ActiveRecord::Base
  validates :title, :sub, :author, presence: true

  has_many :post_subs, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
end
