Rails.application.routes.draw do
  resources :checkouts
  resource :carts, only: [:show]
  resources :order_items
  resources :products
  patch 'slides/:id', to: 'slides#update'
  resources :slides
  patch 'slides/:id', to: 'slides#update'
  devise_for :users
  resources :users
  root to: 'products#index'
end
