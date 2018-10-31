class User < ApplicationRecord
  validates_presence_of :email, :password

  has_many :companies

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         jwt_revocation_strategy: JWTBlacklist
end
