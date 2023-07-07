# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_06_153208) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "capacity_units", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.bigint "item_id"
    t.bigint "cart_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
    t.index ["store_id"], name: "index_cart_items_on_store_id"
  end

  create_table "carts", force: :cascade do |t|
    t.string "adress"
    t.integer "price"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "store_id", null: false
    t.bigint "item_id", null: false
    t.bigint "item_capacity_id"
    t.bigint "item_color_id"
    t.bigint "item_material_id"
    t.bigint "item_size_id"
    t.integer "quantity"
    t.index ["item_capacity_id"], name: "index_carts_on_item_capacity_id"
    t.index ["item_color_id"], name: "index_carts_on_item_color_id"
    t.index ["item_id"], name: "index_carts_on_item_id"
    t.index ["item_material_id"], name: "index_carts_on_item_material_id"
    t.index ["item_size_id"], name: "index_carts_on_item_size_id"
    t.index ["store_id"], name: "index_carts_on_store_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "city"
    t.integer "latitude"
    t.integer "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "hex_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments_items", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments_store_replies", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments_stores", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.index ["store_id"], name: "index_comments_stores_on_store_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.integer "postal_code"
    t.integer "country_code"
    t.string "currency_name"
    t.string "currency_symbol"
    t.integer "exchange"
    t.text "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "latitude"
    t.integer "longitude"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "symbole"
    t.string "name"
    t.integer "exchange"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.string "new_price"
    t.string "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", null: false
    t.index ["item_id"], name: "index_discounts_on_item_id"
  end

  create_table "item_capacities", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", null: false
    t.bigint "capacity_unit_id", null: false
    t.string "image"
    t.index ["capacity_unit_id"], name: "index_item_capacities_on_capacity_unit_id"
    t.index ["item_id"], name: "index_item_capacities_on_item_id"
  end

  create_table "item_categories", force: :cascade do |t|
    t.string "name"
    t.text "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.bigint "item_categories_list_id"
    t.index ["item_categories_list_id"], name: "index_item_categories_on_item_categories_list_id"
    t.index ["item_id"], name: "index_item_categories_on_item_id"
  end

  create_table "item_categories_lists", force: :cascade do |t|
    t.string "name"
    t.text "icon"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_colors", force: :cascade do |t|
    t.string "name"
    t.string "hex_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", null: false
    t.bigint "color_id", null: false
    t.string "image"
    t.index ["color_id"], name: "index_item_colors_on_color_id"
    t.index ["item_id"], name: "index_item_colors_on_item_id"
  end

  create_table "item_comment_likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_comment_id"
    t.index ["item_comment_id"], name: "index_item_comment_likes_on_item_comment_id"
  end

  create_table "item_comment_replies", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_comment_id"
    t.index ["item_comment_id"], name: "index_item_comment_replies_on_item_comment_id"
  end

  create_table "item_comments", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.index ["item_id"], name: "index_item_comments_on_item_id"
  end

  create_table "item_images", force: :cascade do |t|
    t.text "pictures"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.index ["item_id"], name: "index_item_images_on_item_id"
  end

  create_table "item_likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_materials", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", null: false
    t.bigint "material_id", null: false
    t.string "image"
    t.index ["item_id"], name: "index_item_materials_on_item_id"
    t.index ["material_id"], name: "index_item_materials_on_material_id"
  end

  create_table "item_sizes", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.string "code"
    t.string "size_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", null: false
    t.bigint "size_id", null: false
    t.string "image"
    t.index ["item_id"], name: "index_item_sizes_on_item_id"
    t.index ["size_id"], name: "index_item_sizes_on_size_id"
  end

  create_table "items", force: :cascade do |t|
    t.text "names"
    t.string "main_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.string "pictures"
    t.integer "price"
    t.string "currency"
    t.text "description"
    t.integer "quantity"
    t.string "shipping_options"
    t.string "return_policy"
    t.string "availability"
    t.string "category_name"
    t.bigint "search_suggestion_id"
    t.string "token_id"
    t.string "store_token"
    t.index ["search_suggestion_id"], name: "index_items_on_search_suggestion_id"
    t.index ["store_id"], name: "index_items_on_store_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "likes_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.index ["item_id"], name: "index_likes_items_on_item_id"
  end

  create_table "likes_stores", force: :cascade do |t|
    t.integer "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.index ["store_id"], name: "index_likes_stores_on_store_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "exchange"
    t.text "currency"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.bigint "item_id"
    t.bigint "order_id"
    t.bigint "currency_id"
    t.text "item_attributes"
    t.index ["currency_id"], name: "index_order_items_on_currency_id"
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["store_id"], name: "index_order_items_on_store_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "currency"
    t.string "destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "token_id"
    t.string "paid"
    t.string "payed"
    t.string "payment_intent"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "longitude"
    t.string "latitude"
    t.string "postal-adresse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.index ["store_id"], name: "index_places_on_store_id"
  end

  create_table "search_suggestions", force: :cascade do |t|
    t.string "query_name"
    t.string "table_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_search_suggestions_on_user_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_categories", force: :cascade do |t|
    t.string "name"
    t.text "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.bigint "store_categories_list_id"
    t.index ["store_categories_list_id"], name: "index_store_categories_on_store_categories_list_id"
    t.index ["store_id"], name: "index_store_categories_on_store_id"
  end

  create_table "store_categories_lists", force: :cascade do |t|
    t.string "name"
    t.text "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "store_images", force: :cascade do |t|
    t.text "pictures"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.index ["store_id"], name: "index_store_images_on_store_id"
  end

  create_table "store_sales", force: :cascade do |t|
    t.string "adress"
    t.integer "unit_price"
    t.integer "price_paid"
    t.integer "quantity"
    t.integer "item_id"
    t.integer "item_capacity_id"
    t.integer "item_color_id"
    t.integer "item_material_id"
    t.integer "item_size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id", null: false
    t.string "token_id"
    t.index ["store_id"], name: "index_store_sales_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "open-from"
    t.string "close-at"
    t.string "description"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "country_id"
    t.string "image"
    t.bigint "search_suggestion_id"
    t.string "coordinates"
    t.string "token_id"
    t.index ["country_id"], name: "index_stores_on_country_id"
    t.index ["search_suggestion_id"], name: "index_stores_on_search_suggestion_id"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "jti", null: false
    t.string "avatar"
    t.bigint "country_id"
    t.bigint "search_suggestion_id"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["search_suggestion_id"], name: "index_users_on_search_suggestion_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "items"
  add_foreign_key "cart_items", "stores"
  add_foreign_key "carts", "item_capacities"
  add_foreign_key "carts", "item_colors"
  add_foreign_key "carts", "item_materials"
  add_foreign_key "carts", "item_sizes"
  add_foreign_key "carts", "items"
  add_foreign_key "carts", "stores"
  add_foreign_key "carts", "users"
  add_foreign_key "cities", "countries"
  add_foreign_key "comments_stores", "stores"
  add_foreign_key "discounts", "items"
  add_foreign_key "item_capacities", "capacity_units"
  add_foreign_key "item_capacities", "items"
  add_foreign_key "item_categories", "item_categories_lists"
  add_foreign_key "item_categories", "items"
  add_foreign_key "item_colors", "colors"
  add_foreign_key "item_colors", "items"
  add_foreign_key "item_comment_likes", "item_comments"
  add_foreign_key "item_comment_replies", "item_comments"
  add_foreign_key "item_comments", "items"
  add_foreign_key "item_images", "items"
  add_foreign_key "item_materials", "items"
  add_foreign_key "item_materials", "materials"
  add_foreign_key "item_sizes", "items"
  add_foreign_key "item_sizes", "sizes"
  add_foreign_key "items", "search_suggestions"
  add_foreign_key "items", "stores"
  add_foreign_key "likes_items", "items"
  add_foreign_key "likes_stores", "stores"
  add_foreign_key "order_items", "currencies"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "stores"
  add_foreign_key "orders", "users"
  add_foreign_key "places", "stores"
  add_foreign_key "search_suggestions", "users"
  add_foreign_key "store_categories", "store_categories_lists"
  add_foreign_key "store_categories", "stores"
  add_foreign_key "store_images", "stores"
  add_foreign_key "store_sales", "stores"
  add_foreign_key "stores", "countries"
  add_foreign_key "stores", "search_suggestions"
  add_foreign_key "stores", "users"
  add_foreign_key "users", "countries"
  add_foreign_key "users", "search_suggestions"
end
