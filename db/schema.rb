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

ActiveRecord::Schema.define(version: 20181024024714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.string "phone"
    t.string "team_member_1_name"
    t.string "team_member_1_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id"
    t.string "receiving_from"
    t.boolean "receiving_letter", default: false
    t.boolean "receiving_dna", default: false
    t.string "receiving_other", default: ""
    t.boolean "receiving_hazard_bio", default: false
    t.boolean "receiving_hazard_phys", default: false
    t.boolean "receiving_hazard_chem", default: false
    t.string "receiving_hazard_handling", default: ""
    t.string "storage_type"
    t.boolean "storage_dna", default: false
    t.string "storage_other", default: ""
    t.boolean "storage_hazard_bio", default: false
    t.boolean "storage_hazard_phys", default: false
    t.boolean "storage_hazard_chem", default: false
    t.string "storage_hazard_handling", default: ""
    t.string "preparation_method"
    t.boolean "preparation_dna", default: false
    t.string "preparation_other", default: ""
    t.boolean "preparation_hazard_bio", default: false
    t.boolean "preparation_hazard_phys", default: false
    t.boolean "preparation_hazard_chem", default: false
    t.string "preparation_hazard_handling", default: ""
    t.string "packaging_method"
    t.boolean "packaging_dna", default: false
    t.string "packaging_other", default: ""
    t.boolean "packaging_hazard_bio", default: false
    t.boolean "packaging_hazard_phys", default: false
    t.boolean "packaging_hazard_chem", default: false
    t.string "packaging_hazard_handling", default: ""
    t.index ["product_id"], name: "index_ingredients_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  add_foreign_key "products", "companies"
end
