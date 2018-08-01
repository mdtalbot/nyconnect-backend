class User < ApplicationRecord

  validates :username, presence: true, length: {maximum: 50}, uniqueness: true

  validates :password, presence: true, length: {maximum: 50}

  has_many :rep_mail

  has_secure_password

end

