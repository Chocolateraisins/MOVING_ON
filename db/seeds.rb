
User.create!(
   first_name: "Rinou",
   last_name: "Idder",
   email: "pinu.piddder@netherlands.nl",
   phone: "1830803",
   address: "dans ton cul",
   password: "mynameisrinouidder",
   admin: true,
   )

Order.create!(
  user_id: User.all.sample.id,
  status:"pending",
  invoice_amount: 10,
  deceased_first_name:"Bob",
  deceased_last_name: "Sponge",
  deceased_address: "the ocean",
  date_of_death: Date.today,
  )

# Users
puts "Clearing all Users..."
User.destroy_all if Rails.env == "DEVELOPMENT"
# Order.destroy_all if Rails.env == "DEVELOPMENT"

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

puts "Created Admin!"

puts "Creating 10 new Users..." # with Orders..."

10.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: "aaaaaa",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    admin: false,
    )

  # order = Order.create!(user: user, deceased_first_name: Faker::Name.unique.first_name, deceased_last_name: Faker::Name.unique.last_name, date_of_death: Faker::Date.backward(14), invoice_amount: rand(100..10000))

  # inventory = ["piano", "table", "bed", "jewellery", "car", "chair", "book", "carpet"]

  # rand(0..5).times do
  #   inventory = Inventory.create!(oder: order, description: inventory.sample, value: rand(100..10000))
  # end

end

puts "Created #{User.count} new Users!" # and #{Order.count} new Orders."

# ------------------------------------------------------

# Services
puts "Clearing all Services..."
Service.destroy_all if Rails.env == "DEVELOPMENT"

puts "Creating Services House Clearance, Mail Forwarding, Contract Cancellation"

service_1 = Service.create!(name: "House Clearance")
service_2 = Service.create!(name: "Mail Forwarding")
service_3 = Service.create!(name: "Contract Cancellation")

puts "Created #{Service.count} new services."

# ------------------------------------------------------

# ServiceItems
puts "Clearing all ServiceItems..."
ServiceItem.destroy_all if Rails.env == "DEVELOPMENT"

puts "Creating ServiceItems for #{Service.count} Services..."

# ServiceItems for Service 1
service_item_1 = ServiceItem.create!(service: service_1, content: "number of rooms", unit_price: 0, quantifiable: true, category: "information")
service_item_2 = ServiceItem.create!(service: service_1, content: "total area", unit_price: 10, quantifiable: true, category: "information")
service_item_3 = ServiceItem.create!(service: service_1, content: "property type", unit_price: 0, quantifiable: false, category: "information")
service_item_4 = ServiceItem.create!(service: service_1, content: "moving date time", unit_price: 0, quantifiable: true, category: "information")
service_item_5 = ServiceItem.create!(service: service_1, content: "belongings action", unit_price: 0, quantifiable: false, category: "task")
service_item_6 = ServiceItem.create!(service: service_1, content: "cleaning", unit_price: 5, quantifiable: false, category: "task")

# ServiceItems for Service 2
service_item_1 = ServiceItem.create!(service: service_2, content: "mail forwarding", unit_price: 15, quantifiable: false, category: "task")
service_item_2 = ServiceItem.create!(service: service_2, content: "forwrding address", unit_price: 0, quantifiable: false, category: "information")

# ServiceItems for Service 3
service_item_1 = ServiceItem.create!(service: service_3, content: "cancel contract", unit_price: 0, quantifiable: false, category: "task")
service_item_2 = ServiceItem.create!(service: service_3, content: "type of contract", unit_price: 0, quantifiable: false, category: "information")
service_item_3 = ServiceItem.create!(service: service_3, content: "name of provider", unit_price: 0, quantifiable: false, category: "information")

# ------------------------------------------------------

puts "ExSeedingly succSeeded!!!"



