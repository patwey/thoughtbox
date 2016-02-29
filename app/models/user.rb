class User < ActiveRecord::Base
  has_secure_password
  has_many :links

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end
