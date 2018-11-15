Rails.application.routes.draw do

   resources :orders do
    resources :inventories
    resources :service_item_orders
  end

  devise_for :users
  root to: 'pages#home'

end
