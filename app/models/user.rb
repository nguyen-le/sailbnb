class User < ActiveRecord::Base
  attr_reader :password
  validates :f_name, :l_name, :email_address, :password_digest, 
    :session_token, presence: true
  validates :email_address, :uniqueness => true
  validates :password, length: { minimum: 6 }, allow_nil: true
  after_initialize :ensure_session_token

  has_many :properties

  def self.generate_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    found_user = User.find_by_email_address(email)
    return nil unless found_user
    if found_user.is_password?(password)
      found_user
    else
      nil
    end
  end

  def ensure_session_token
    self.session_token ||= User.generate_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password            = password
  end

  def reset_session_token!
    self.update!(session_token: User.generate_token)
    self.session_token
  end
end