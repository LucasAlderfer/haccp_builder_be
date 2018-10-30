class Company < ApplicationRecord
  validates_presence_of :name, :email, :password

  has_many :products
  has_many :ingredients, through: :products

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         jwt_revocation_strategy: JWTBlacklist
end
