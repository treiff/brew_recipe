# Generates user objects
class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, length: { maximum: 50 },
                       uniqueness: { case_sensitive: false },
                       allow_blank: true
  validates :email,    presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL },
                       uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  has_many :beers

  # Omniauth for facebook login.
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.username = "blah"
      user.password = SecureRandom.urlsafe_base64(6)
      user.password_confirmation = user.password
      user.email = auth.info.email
      user.avatar_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
