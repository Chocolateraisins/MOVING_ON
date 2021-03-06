Rails.application.routes.draw do

  namespace :admin do
    resources :services do
      resources :service_items
    end
  end

  devise_for :users
  root to: 'pages#home'

  namespace :admin do
    resources :orders, only: [:index, :destroy] do
    end
    resources :order_items, only: [:update]
  end

  resources :orders do
    resources :inventories
    resources :order_items
  end


end
