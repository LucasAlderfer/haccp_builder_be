class Company < ApplicationRecord
  validates_presence_of :name, :email, :password
  has_secure_password
  has_many :products
  has_many :ingredients, through: :products
end
