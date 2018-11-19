Rails.application.routes.draw do

  namespace :admin do
    get 'orders/index'
  end
  get 'admin_orders/index'
  devise_for :users
  root to: 'pages#home'

  namespace :admin do
    resources :orders, only: [:index, :destroy] do
      resources :order_items, only: [:get,:update]
    end
  end



  resources :orders do
    resources :inventories
    resources :order_items
  end
end
