# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing all Services, Users, Orders"



# create_table "inventories", force: :cascade do |t|
#     t.string "description"
#     t.integer "value"
#     t.bigint "order_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["order_id"], name: "index_inventories_on_order_id"
#   end

#   create_table "orders", force: :cascade do |t|
#     t.string "status"
#     t.integer "invoice_amount"
#     t.string "deceased_first_name"
#     t.string "deceased_last_name"
#     t.string "deceased_address"
#     t.date "date_of_death"
#     t.bigint "user_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["user_id"], name: "index_orders_on_user_id"
#   end

#   create_table "service_item_orders", force: :cascade do |t|
#     t.bigint "order_id"
#     t.bigint "service_item_id"
#     t.string "content"
#     t.boolean "completed"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["order_id"], name: "index_service_item_orders_on_order_id"
#     t.index ["service_item_id"], name: "index_service_item_orders_on_service_item_id"
#   end

#   create_table "service_items", force: :cascade do |t|
#     t.string "content"
#     t.bigint "service_id"
#     t.integer "unit_price"
#     t.boolean "quantifiable"
#     t.string "type"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["service_id"], name: "index_service_items_on_service_id"
#   end

#   create_table "services", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["email"], name: "index_users_on_email", unique: true
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#   end

#   add_foreign_key "inventories", "orders"
#   add_foreign_key "orders", "users"
#   add_foreign_key "service_item_orders", "orders"
#   add_foreign_key "service_item_orders", "service_items"
#   add_foreign_key "service_items", "services"
# end
