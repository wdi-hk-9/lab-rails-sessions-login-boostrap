class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 3}
  has_many :photos
end
