class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :team_member_1_name
      t.string :team_member_1_title
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
