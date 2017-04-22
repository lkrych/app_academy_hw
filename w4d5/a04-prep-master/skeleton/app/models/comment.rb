class Comment < ActiveRecord::Base
  validates :body, :user, :link, presence: true

  belongs_to :link

  def body=(body)
    self.body = body
  end

  def link=(link)
    self.link = link
  end

  def user=(user)
    self.user = user
  end

  def reflect_on_association
  end
end
