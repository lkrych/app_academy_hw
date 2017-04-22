class Comment < ActiveRecord::Base
  validates :body, :user, :link, presence: true
  attr_accessor :body

  belongs_to :link,
    primary_key: :id,
    foreign_key: :link_id,
    class_name: 'Link'

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

end
