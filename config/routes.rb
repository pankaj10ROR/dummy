Rails.application.routes.draw do

  get 'charges/new'
  get 'charges/create'
  root "products#index"
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  get 'wishlists/show'
  delete 'carts/:id' => "carts#destroy"
  get 'carts/:id' => "carts#show", as: "cart"
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  get 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  get 'products/list_of_product' => 'products#list_of_product'
  get 'products/unapproved_product' => 'products#unapproved_product'
  get 'wishlists/:id' => "wishlists#show", as: "wishlist"
  delete 'wishlists/:id' => "wishlists#destroy"
  get 'wish_items' => "wish_items#create"
  get 'wish_items/:id' => "wish_items#show", as: "wish_item"
  delete 'wish_items/:id' => "wish_items#destroy"
  get 'orders/:order_id/refund' => "charges#refund", as: "refund"
    
  resources :products
  resources :orders
  resources :orders do
  resources :charges, only: [:new, :create]
end
  devise_for :sellers, controllers: {
    sessions: 'sellers/sessions',
    passwords: 'sellers/passwords',
    registrations: 'sellers/registrations'
  }

  get "/products/cart", to: "products#cart"

  resources :products do
   resources :reasons
 end
 devise_for :customers, controllers: {
  sessions: 'customers/sessions',
  passwords: 'customers/passwords',
  registrations: 'customers/registrations',
  confirmations: 'customers/confirmations',
  omniauth_callbacks: 'customers/omniauth_callbacks'
}


devise_for :admin_users, ActiveAdmin::Devise.config
ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :products
  resources :sellers
end
