class Company < ApplicationRecord
  validates_presence_of :id, :name, :email, :password, :address, :phone, :team_member_1_name, :team_member_1_title
  has_secure_password
end