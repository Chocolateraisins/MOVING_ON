
# Users
puts "Clearing all Users..."
User.destroy_all if Rails.env == "DEVELOPMENT"

puts "Creating Admin..."

User.create!(
   first_name: "Ellyn",
   last_name: "Bouscas",
   email: "ellyn@gmail.com",
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
end

puts "Created #{User.count} new Users in total!"

# ------------------------------------------------------

# Orders and Inventories
puts "Clearing all Orders and Invetories..."
Order.destroy_all if Rails.env == "DEVELOPMENT"
Inventory.destroy_all if Rails.env == "DEVELOPMENT"

inventory = ["piano", "table", "bed", "jewellery", "car", "chair", "book", "carpet"]

puts "Creating first random order..."

order_1 = Order.create!(
  user: User.find(2),
  status: "pending",
  invoice_amount: rand(100..10000),
  deceased_first_name: Faker::Name.unique.first_name,
  deceased_last_name: Faker::Name.unique.last_name,
  deceased_address: "Frii Hotel, Bali",
  date_of_death: Faker::Date.backward(14),
  )

puts "Adding Inventory..."

  rand(3..7).times do
  Inventory.create!(order: order_1, description: inventory.sample, value: rand(100..10000))
  end

puts "Creating second random order..."

order_2 = Order.create!(
  user: User.find(7),
  status: "pending",
  invoice_amount: rand(100..10000),
  deceased_first_name: Faker::Name.unique.first_name,
  deceased_last_name: Faker::Name.unique.last_name,
  deceased_address: "16, Villa Gaudelet",
  date_of_death: Faker::Date.backward(14),
  )

puts "Adding Inventory..."

rand(3..7).times do
  Inventory.create!(order: order_2, description: inventory.sample, value: rand(100..10000))
  end

puts "Created #{Order.count} Orders with a total of #{Inventory.count} Inventory items!"

# ------------------------------------------------------

# Services
puts "Clearing all Services..."
Service.destroy_all if Rails.env == "DEVELOPMENT"

puts "Creating Services House Clearance, Mail Forwarding, Contract Cancellation"

service_1 = Service.create!(name: "House Clearance", description: "No matter the size or type of home your lost one lived in – we will carefully clear out all belongings and store, sell or move them for you.")
service_2 = Service.create!(name: "Mail Forwarding", description: "We will make sure all mail gets forwarded to the right recipient – simply provide us with a forwarding address.")
service_3 = Service.create!(name: "Contract Cancellation", description: "We can take care of the cancelation of any phone lines, TV subscriptions and other contracts registered at this address. This will save you any associated paperwork.")
service_4 = Service.create!(name: "House Maintenance", description: "Our team of professionals will conduct monthly check ups and cleaning on your loved one's house. Give yourself time to decide what to do with the property.")

puts "Created #{Service.count} new services!"

# ------------------------------------------------------

# ServiceItems
puts "Clearing all ServiceItems..."
ServiceItem.destroy_all if Rails.env == "DEVELOPMENT"

puts "Creating ServiceItems for #{Service.count} Services..."

# ServiceItems for Service 1
service_item_1 = ServiceItem.create!(service: service_1, additional_information: Faker::Lorem.sentence(3, true, 4), content: "How many rooms does the home have?", unit_price: 0, data_type: "number", category: "information")
service_item_2 = ServiceItem.create!(service: service_1, additional_information: Faker::Lorem.sentence(3, true, 4), content: "What is the total floor area of the home?", unit_price: 10, data_type: "number", category: "information")
service_item_3 = ServiceItem.create!(service: service_1, additional_information: Faker::Lorem.sentence(3, true, 4), content: "What type of home was this? I.e. an apartment, house, etc.", unit_price: 0, category: "information")
service_item_4 = ServiceItem.create!(service: service_1, additional_information: Faker::Lorem.sentence(3, true, 4), content: "When do you want our  team to move furniture and belongings from the house?", unit_price: 0, data_type: "datetime-local", category: "information")
service_item_5 = ServiceItem.create!(service: service_1, additional_information: Faker::Lorem.sentence(3, true, 4), content: "What would you like us to do with your loved one's belongings? We can move everyting into storage, auction it for you or move it to another address.", unit_price: 0, category: "task")

# ServiceItems for Service 2

service_item_8 = ServiceItem.create!(service: service_2, additional_information: Faker::Lorem.sentence(3, true, 4), content: "Where would you like any future mail to be forwarded?", unit_price: 50, data_type: address, category: "task")

# ServiceItems for Service 3
service_item_10 = ServiceItem.create!(service: service_3, additional_information: Faker::Lorem.sentence(3, true, 4), content: "What type of contracts would you like to cancel? You can specify up to 3 contracts below.", unit_price: 50, category: "task")
service_item_11 = ServiceItem.create!(service: service_3, additional_information: Faker::Lorem.sentence(3, true, 4), content: "What is the name of the provider?", unit_price: 0, category: "information")
service_item_12 = ServiceItem.create!(service: service_3, additional_information: Faker::Lorem.sentence(3, true, 4), content: "What type of contracts would you like to cancel?", unit_price: 0, category: "task")
service_item_13 = ServiceItem.create!(service: service_3, additional_information: Faker::Lorem.sentence(3, true, 4), content: "What is the name of the provider?", unit_price: 0, category: "information")
service_item_14 = ServiceItem.create!(service: service_3, additional_information: Faker::Lorem.sentence(3, true, 4), content: "What type of contracts would you like to cancel?", unit_price: 0, category: "task")
service_item_15 = ServiceItem.create!(service: service_3, additional_information: Faker::Lorem.sentence(3, true, 4), content: "What is the name of the provider?", unit_price: 0, category: "information")

# ServiceItems for Service 4

puts "Created #{ServiceItem.count} ServiceItems!"
service_item_16 = ServiceItem.create!(service: service_4, additional_information: Faker::Lorem.sentence(3, true, 4), content: "Is there anything we should take into consideration when taking care of the home? Just let us know here.", unit_price: 500, category: "information")

# ------------------------------------------------------

# ServiceItemsOrders
puts "Clearing all OrderItems..."
ServiceItemsOrders.destroy_all if Rails.env == "DEVELOPMENT"

property_types = ["house", "apartment", "specify"]
belongings_actions = ["auction", "donate", "move", "throw away"]
type_of_contracts = ["phone", "electricity", "tv", "gas", "internet", "cleaner", "insurance"]

puts "Creating OrderItems for first Order..."

# OrderItem for Service 1, Order 1
order_item_1 = OrderItem.create!(order: order_1, service_item: service_item_1, content: rand(1..7), completed: false)
order_item_2 = OrderItem.create!(order: order_1, service_item: service_item_2, content: rand(30..250), completed: false)
order_item_3 = OrderItem.create!(order: order_1, service_item: service_item_3, content: property_types.sample, completed: false)
order_item_4 = OrderItem.create!(order: order_1, service_item: service_item_4, content: Faker::Date.forward(30), completed: false)
order_item_5 = OrderItem.create!(order: order_1, service_item: service_item_5, content: belongings_actions.sample, completed: false)

# OrderItem for Service 2, Order 1
# order_item_7 = OrderItem.create!(order: order_1, service_item: service_item_7, content: "yes", completed: false)
order_item_8 = OrderItem.create!(order: order_1, service_item: service_item_8, content: Faker::Address.street_address, completed: false)

# OrderItem for Service 3, Order 1
# order_item_9 = OrderItem.create!(order: order_1, service_item: service_item_9, content: "yes", completed: false)
order_item_10 = OrderItem.create!(order: order_1, service_item: service_item_10, content: type_of_contracts.sample, completed: false)
order_item_11 = OrderItem.create!(order: order_1, service_item: service_item_11, content: "my defined provider", completed: false)

puts "Created OrderItems for first Order!"

puts "Creating OrderItems for second Order..."

# OrderItem for Service 1, Order 2
order_item_1 = OrderItem.create!(order: order_2, service_item: service_item_1, content: rand(1..7), completed: false)
order_item_2 = OrderItem.create!(order: order_2, service_item: service_item_2, content: rand(30..250), completed: false)
order_item_3 = OrderItem.create!(order: order_2, service_item: service_item_3, content: property_types.sample, completed: false)
order_item_4 = OrderItem.create!(order: order_2, service_item: service_item_4, content: Faker::Date.forward(30), completed: false)
order_item_5 = OrderItem.create!(order: order_2, service_item: service_item_5, content: belongings_actions.sample, completed: false)

# OrderItem for Service 2, Order 2
# order_item_7 = OrderItem.create!(order: order_2, service_item: service_item_7, content: "yes", completed: false)
order_item_8 = OrderItem.create!(order: order_2, service_item: service_item_8, content: Faker::Address.street_address, completed: false)

# OrderItem for Service 3, Order 2
# order_item_9 = OrderItem.create!(order: order_2, service_item: service_item_9, content: "yes", completed: false)
order_item_10 = OrderItem.create!(order: order_2, service_item: service_item_10, content: type_of_contracts.sample, completed: false)
order_item_11 = OrderItem.create!(order: order_2, service_item: service_item_11, content: "my defined provider", completed: false)

puts "Created OrderItems for second Order!"

puts "Created #{OrderItem.count} OrderItems for #{Order.count} Orders involving #{Service.count} Services!"

# ------------------------------------------------------

puts "ExSeedingly succSeeded!!!"



