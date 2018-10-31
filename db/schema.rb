# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181031201211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "team_member_1_name"
    t.string "team_member_1_title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id"
    t.string "receiving_from", default: ""
    t.boolean "receiving_letter", default: false
    t.boolean "receiving_dna", default: false
    t.string "receiving_other", default: ""
    t.boolean "receiving_hazard_bio", default: false
    t.boolean "receiving_hazard_phys", default: false
    t.boolean "receiving_hazard_chem", default: false
    t.string "receiving_hazard_handling", default: ""
    t.string "inventory_type", default: ""
    t.boolean "inventory_dna", default: false
    t.string "inventory_other", default: ""
    t.boolean "inventory_hazard_bio", default: false
    t.boolean "inventory_hazard_phys", default: false
    t.boolean "inventory_hazard_chem", default: false
    t.string "inventory_hazard_handling", default: ""
    t.string "processing_method", default: ""
    t.boolean "processing_dna", default: false
    t.string "processing_other", default: ""
    t.boolean "processing_hazard_bio", default: false
    t.boolean "processing_hazard_phys", default: false
    t.boolean "processing_hazard_chem", default: false
    t.string "processing_hazard_handling", default: ""
    t.string "packaging_method", default: ""
    t.boolean "packaging_dna", default: false
    t.string "packaging_other", default: ""
    t.boolean "packaging_hazard_bio", default: false
    t.boolean "packaging_hazard_phys", default: false
    t.boolean "packaging_hazard_chem", default: false
    t.string "packaging_hazard_handling", default: ""
    t.index ["product_id"], name: "index_ingredients_on_product_id"
  end

  create_table "jwt_blacklist", force: :cascade do |t|
    t.string "jti", null: false
    t.index ["jti"], name: "index_jwt_blacklist_on_jti"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "users"
  add_foreign_key "products", "companies"
end
