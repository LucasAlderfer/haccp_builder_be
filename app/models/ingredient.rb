class Ingredient < ApplicationRecord
  validates_presence_of :name, :receiving_from, :storage_type, :preparation_method, :packaging_method
  belongs_to :product
  delegate :company, :to => :product, :allow_nil => true
end
