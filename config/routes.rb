Rails.application.routes.draw do

  namespace :admin do
  end

  devise_for :users
  root to: 'pages#home'

  namespace :admin do
    resources :orders, only: [:index, :destroy] do
      resources :order_items, only: [:update]
    end
  end

  resources :orders do
    resources :inventories
    resources :order_items
  end

  resources :services do
    resources :service_items
  end

end
