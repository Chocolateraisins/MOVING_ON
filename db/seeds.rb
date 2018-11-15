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

