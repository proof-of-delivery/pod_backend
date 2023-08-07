Rails.application.routes.draw do
  resources :packaging_items
  resources :packaging_details
  resources :pickup_items
  resources :pickup_orders
  resources :customers
  resources :items
  get '/warehouse_orders/confirmed', controller: :warehouse_orders, action: :confirmed_warehouseorders
  get '/warehouse_items/confirmed', controller: :warehouse_items, action: :confirmed_warehouse_items
  resources :warehouse_orders
  resources :warehouse_items do 
    member do
      post :request_quantity
      post :confirm_quantity
    end
  end

  post '/warehouse_orders/filter', controller: :warehouse_orders, action: :filter
  post '/warehouse_items/filter', controller: :warehouse_items, action: :filter

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
