class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :phone, :team_member_1_name, :team_member_1_title, :products

  def products
    object.products.map do |product|
      ProductSerializer.new(product)
    end
  end
end
