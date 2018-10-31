class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone, :team_member_1_name, :team_member_1_title, :products, :user_id

  def products
    object.products.map do |product|
      ProductSerializer.new(product)
    end
  end
end
