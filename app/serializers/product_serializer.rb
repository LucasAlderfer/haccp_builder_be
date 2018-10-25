class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :ingredients
end
