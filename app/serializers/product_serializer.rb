class ProductSerializer < ActiveModel::Serializer
  attributes :id, :company_id, :name, :ingredients

  def ingredients
    object.ingredients.map do |ingredient|
      IngredientSerializer.new(ingredient)
    end
  end
end
