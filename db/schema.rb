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

ActiveRecord::Schema.define(version: 20160820083628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.boolean  "available_all_day"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "index"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "slug"
    t.index ["restaurant_id", "slug"], name: "index_categories_on_restaurant_id_and_slug", unique: true, using: :btree
    t.index ["restaurant_id"], name: "index_categories_on_restaurant_id", using: :btree
  end

  create_table "category_translations", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.index ["category_id"], name: "index_category_translations_on_category_id", using: :btree
    t.index ["locale"], name: "index_category_translations_on_locale", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "group_translations", force: :cascade do |t|
    t.integer  "group_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["group_id"], name: "index_group_translations_on_group_id", using: :btree
    t.index ["locale"], name: "index_group_translations_on_locale", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "maximum"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_groups_on_product_id", using: :btree
  end

  create_table "option_translations", force: :cascade do |t|
    t.integer  "option_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["locale"], name: "index_option_translations_on_locale", using: :btree
    t.index ["option_id"], name: "index_option_translations_on_option_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "name"
    t.decimal  "price",      default: "0.0", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["group_id"], name: "index_options_on_group_id", using: :btree
  end

  create_table "options_order_items", force: :cascade do |t|
    t.integer  "option_id"
    t.integer  "order_item_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["option_id"], name: "index_options_order_items_on_option_id", using: :btree
    t.index ["order_item_id"], name: "index_options_order_items_on_order_item_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "size_id"
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.decimal  "total_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
    t.index ["restaurant_id"], name: "index_order_items_on_restaurant_id", using: :btree
    t.index ["size_id"], name: "index_order_items_on_size_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.decimal  "subtotal"
    t.decimal  "total"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "product_translations", force: :cascade do |t|
    t.integer  "product_id",        null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.string   "short_description"
    t.text     "description"
    t.index ["locale"], name: "index_product_translations_on_locale", using: :btree
    t.index ["product_id"], name: "index_product_translations_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "category_id"
    t.string   "name"
    t.string   "short_description"
    t.string   "weight"
    t.text     "description"
    t.decimal  "price",                null: false
    t.integer  "average_prepare_time"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["restaurant_id"], name: "index_products_on_restaurant_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",                                             null: false
    t.string   "address",                                          null: false
    t.string   "wifipassword"
    t.string   "phone_number"
    t.string   "country",                        default: "en-GB"
    t.string   "google_id"
    t.string   "code",                                             null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "restaurant_avatar_file_name"
    t.string   "restaurant_avatar_content_type"
    t.integer  "restaurant_avatar_file_size"
    t.datetime "restaurant_avatar_updated_at"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "slug"
    t.index ["slug"], name: "index_restaurants_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_restaurants_on_user_id", using: :btree
  end

  create_table "size_translations", force: :cascade do |t|
    t.integer  "size_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "description"
    t.index ["locale"], name: "index_size_translations_on_locale", using: :btree
    t.index ["size_id"], name: "index_size_translations_on_size_id", using: :btree
  end

  create_table "sizes", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.decimal  "price",       default: "0.0"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["product_id"], name: "index_sizes_on_product_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.string   "phone_number"
    t.string   "locale",                 default: "en"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "categories", "restaurants"
  add_foreign_key "groups", "products"
  add_foreign_key "options", "groups"
  add_foreign_key "options_order_items", "options"
  add_foreign_key "options_order_items", "order_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_items", "restaurants"
  add_foreign_key "order_items", "sizes"
  add_foreign_key "orders", "restaurants"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "restaurants"
  add_foreign_key "sizes", "products"
end
