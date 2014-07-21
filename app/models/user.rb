class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password_digest
  before_create :ensure_remember_token

  has_secure_password
  has_many :events

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest token
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  
  def ensure_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end