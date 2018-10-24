class Product < ApplicationRecord
  validates_presence_of :id, :name
  belongs_to :company
end
