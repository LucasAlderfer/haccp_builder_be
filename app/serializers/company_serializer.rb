class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :phone, :team_member_1_name, :team_member_1_title, :products

  def products
    array = []
    object.products.each do |product|
      binding.pry
      serialized_product = {
        "id" => product.id,
        "name" => product.name,
        "ingredients" => product.ingredients
      }
      array << serialized_product
    end
  end
end
