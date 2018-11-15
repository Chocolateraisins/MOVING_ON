# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


inventory = ["piano", "table", "bed", "jewellery", "car", "chair", "book", "carpet"]

# Services
puts "Clearing all Services..."
Service.destroy_all if Rails.env == "DEVELOPMENT"

puts "Creating Services House Clearance, Mail Forwarding, Contract Cancellation"

service_1 = Service.create!(name: "House Clearance")
service_2 = Service.create!(name: "Mail Forwarding")
service_3 = Service.create!(name: "Contract Cancellation")

puts "Created #{Service.count} new services."


# ServiceItems
puts "Clearing all ServiceItems..."
ServiceItem.destroy_all if Rails.env == "DEVELOPMENT"

puts "Creating ServiceItems for #{Service.count}Services..."

# ServiceItems for Service 1
service_item_1 = ServiceItem.create!(service: service_1, content: "number of rooms", unit_price: 0, quantifiable: true, type: "information")
service_item_2 = ServiceItem.create!(service: service_1, content: "total area", unit_price: 10, quantifiable: true, type: "information")
service_item_3 = ServiceItem.create!(service: service_1, content: "property type", unit_price: 0, quantifiable: false, type: "information")
service_item_4 = ServiceItem.create!(service: service_1, content: "moving date time", unit_price: 0, quantifiable: true, type: "information")
service_item_5 = ServiceItem.create!(service: service_1, content: "belongings action", unit_price: 0, quantifiable: false, type: "task")
service_item_6 = ServiceItem.create!(service: service_1, content: "cleaning", unit_price: 5, quantifiable: false, type: "task")

# ServiceItems for Service 2
service_item_1 = ServiceItem.create!(service: service_2, content: "mail forwarding", unit_price: 15, quantifiable: false, type: "task")
service_item_2 = ServiceItem.create!(service: service_2, content: "forwrding address", unit_price: 0, quantifiable: false, type: "information")

# ServiceItems for Service 3
service_item_1 = ServiceItem.create!(service: service_3, content: "cancel contract", unit_price: 0, quantifiable: false, type: "task")
service_item_2 = ServiceItem.create!(service: service_3, content: "type of contract", unit_price: 0, quantifiable: false, type: "information")



# Users
puts "Clearing all Users and Orders..."
User.destroy_all if Rails.env == "DEVELOPMENT"
Order.destroy_all if Rails.env == "DEVELOPMENT"

puts "Creating Admin..."

User.create!(
   first_name: "Rinou",
   last_name: "Idder",
   email: "rinou.idder@netherlands.nl",
   phone: Faker::PhoneNumber.phone_number,
   address: Faker::Address.street_address,
   password: "aaaaaa",
   admin: true,
   )

puts "Created Admin."

puts "Creating 10 new Users with Orders..."

10.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: "aaaaaa",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    password: "aaaaaa",
    admin: false,
    )

  order = Order.create!(user: user, deceased_first_name: Faker::Name.unique.first_name, deceased_last_name: Faker::Name.unique.last_name, date_of_death: Faker::Date.backward(14), invoice_amount: rand(100..10000))

  rand(0..5).times do
    inventory = Inventory.create!(oder: order, description: inventory.sample, value: rand(100..10000))
  end



end

puts "Created #{User.count} new Users and #{Order.count} new Orders."


#


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
