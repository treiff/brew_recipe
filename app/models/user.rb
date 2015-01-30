class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: { case_sensitive: false }
  validates :email,    presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL },
                       uniqueness: { case_sensitive: false }
has_secure_password
validates :password, length: { minimum: 6 }
end
