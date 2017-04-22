class User < ApplicationRecord
  validates :email, :password_digest, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  after_initialize :ensure_session_token
  attr_reader :password

  has_many :goals

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    if user.is_password?(password)
      return user
    else
      return nil
    end
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
