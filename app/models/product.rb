class Product < ApplicationRecord
  validates_presence_of :name
  belongs_to :company
  has_many :ingredients
end
