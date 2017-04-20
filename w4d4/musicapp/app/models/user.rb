class User < ActiveRecord::Base
  validates :email,  presence: true
  validates :password_digest, presence: { message: 'Password can\'t be blank'}
  validates :password, length: { minimum: 6, allow_nil: true}
end
