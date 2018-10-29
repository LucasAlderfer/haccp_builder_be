class Ingredient < ApplicationRecord
  validates_presence_of :name
  belongs_to :product
  delegate :company, :to => :product, :allow_nil => true
end
