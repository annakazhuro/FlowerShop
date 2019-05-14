Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :products
  resources :categories
  resources :subcategories
end
