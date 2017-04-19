class User < ActiveRecord::Base
  before_validation :ensure_session_token

  validates :username, :session_token, presence: true
  validates :password_digest, presence: true, message: 'Password can\'t be blank'
  validates :password, length: {minimum: 6, allow_nil: true }

  def self.find_by_credentials
  end

  def generate_session_token
  end

  def reset_session_token!
  end

  def ensure_session_token
  end
  
  def password=
  end
end
