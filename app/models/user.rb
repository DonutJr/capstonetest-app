class User < ApplicationRecord
  has_secure_password

  has_many :trades

  validates :username, uniqueness: true


end
