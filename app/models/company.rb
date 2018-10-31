class Company < ApplicationRecord
  validates_presence_of :name

  belongs_to :user
  has_many :products
  has_many :ingredients, through: :products
end
