Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :orders do
    resources :inventories
    resources :service_item_orders
  end

end
