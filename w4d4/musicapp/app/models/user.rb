class User < ActiveRecord::Base
  validates :email,  presence: true
  validates :password_digest, presence: { message: 'Password can\'t be blank'}
  validates :password, length: { minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  def self.find_by_credentials(email,password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def password=(password)
    self.digest_password = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.digest_password).is_password?(password)
  end

  private


end
