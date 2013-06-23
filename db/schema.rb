# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130623154348) do

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.string   "module_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses_companies", id: false, force: true do |t|
    t.integer  "business_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name_en"
    t.string   "name_zh_CN"
    t.string   "address_en"
    t.string   "address_zh_CN"
    t.string   "zip_code"
    t.string   "tel"
    t.string   "tel2"
    t.string   "fax"
    t.string   "email"
    t.string   "website"
    t.string   "longitude"
    t.string   "latitude"
    t.string   "logo"
    t.string   "bank_name"
    t.string   "bank_number"
    t.string   "technical_support_qq"
    t.string   "online_consultation_qq"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_certifications", force: true do |t|
    t.integer  "company_id"
    t.string   "name_en"
    t.string   "name_zh_CN"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_certifications", ["company_id"], name: "index_company_certifications_on_company_id", using: :btree

  create_table "company_domains", force: true do |t|
    t.integer  "company_id"
    t.string   "domain"
    t.string   "icp_record_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_domains", ["company_id"], name: "index_company_domains_on_company_id", using: :btree

  create_table "company_employees", force: true do |t|
    t.integer  "company_id"
    t.string   "name_en"
    t.string   "name_zh_CN"
    t.string   "phone"
    t.string   "tel"
    t.string   "fax"
    t.string   "email"
    t.string   "qq"
    t.string   "skype"
    t.string   "position_en"
    t.string   "position_zh_CN"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_employees", ["company_id"], name: "index_company_employees_on_company_id", using: :btree

  create_table "company_feedbacks", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_feedbacks", ["company_id"], name: "index_company_feedbacks_on_company_id", using: :btree

  create_table "company_introductions", force: true do |t|
    t.integer  "company_id"
    t.text     "introduction_en"
    t.text     "introduction_zh_CN"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_introductions", ["company_id"], name: "index_company_introductions_on_company_id", using: :btree

  create_table "company_post_categories", force: true do |t|
    t.integer  "company_id"
    t.string   "name_en"
    t.string   "name_zh_CN"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_post_categories", ["company_id"], name: "index_company_post_categories_on_company_id", using: :btree

  create_table "company_posts", force: true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "company_post_category_id"
    t.string   "title_en"
    t.string   "title_zh_CN"
    t.text     "content_en"
    t.text     "content_zh_CN"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_posts", ["company_id"], name: "index_company_posts_on_company_id", using: :btree
  add_index "company_posts", ["company_post_category_id"], name: "index_company_posts_on_company_post_category_id", using: :btree
  add_index "company_posts", ["user_id"], name: "index_company_posts_on_user_id", using: :btree

  create_table "company_product_categories", force: true do |t|
    t.integer  "company_id"
    t.string   "name_en"
    t.string   "name_zh_CN"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_product_categories", ["company_id"], name: "index_company_product_categories_on_company_id", using: :btree

  create_table "company_product_images", force: true do |t|
    t.integer  "company_product_id"
    t.string   "location"
    t.string   "image"
    t.string   "status"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_content_type"
    t.string   "bucket"
    t.string   "key"
    t.string   "upload_token_expires_in"
    t.string   "upload_result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_product_images", ["company_product_id"], name: "index_company_product_images_on_company_product_id", using: :btree

  create_table "company_products", force: true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "company_product_category_id"
    t.string   "name_en"
    t.string   "name_zh_CN"
    t.text     "introduction_en"
    t.text     "introduction_zh_CN"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_products", ["company_id"], name: "index_company_products_on_company_id", using: :btree
  add_index "company_products", ["company_product_category_id"], name: "index_company_products_on_company_product_category_id", using: :btree
  add_index "company_products", ["user_id"], name: "index_company_products_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "company_id"
    t.string   "company_identity"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
