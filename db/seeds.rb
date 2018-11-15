# User seed

User.create!(
    first_name: "Rinou",
    last_name: "Idder",
    email: "rinou.idder@netherlands.nl",
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    password: "mynameisrinouidder",
    admin: true,
    )

20.times do |user|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name ,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    password: [1,2,3,4,5,6,7,8,9,'a','t','b','d','u','x','o'].sample(6).join,
    admin: false,
    )
end


