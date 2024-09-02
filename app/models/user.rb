class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_secure_password
  has_one_attached :avatar
  has_many :messages
  has_many :chatrooms, through: :messages
end