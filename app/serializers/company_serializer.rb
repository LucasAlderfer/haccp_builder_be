class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :phone, :team_member_1_name, :team_member_1_title
end
