Rails.application.routes.draw do
  resources :packaging_items
  resources :packaging_details
  resources :pickup_items
  resources :pickup_orders
  resources :warehouse_items
  resources :customers
  resources :items
  resources :warehouse_orders

  post '/warehouse_orders/filter', controller: :warehouse_orders, action: :filter
  post '/warehouse_items/filter', controller: :warehouse_items, action: :filter
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
