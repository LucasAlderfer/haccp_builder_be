class Company < ApplicationRecord
  validates_presence_of :name, :email, :password, :address, :phone, :team_member_1_name, :team_member_1_title
  has_secure_password
  has_many :products
end
