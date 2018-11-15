Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# orders
#service_item_orders
#inventory
#service_items
#services

#users < orders <inventory
#services < service_items < services service_item_orders<
