Rails.application.routes.draw do
  devise_for :users
  root to: 'beverages#index'
  resources :beverages, only: %i[index show]

  get 'beverages/:id/buy', to: "beverages#buy", as: 'beverages_buy'
  post 'beverages/:id/finalize', to: "beverages#finalize", as: 'beverages_finalize'
  get 'orders/:id/finalize', to: "beverages#seller", as: 'beverages_seller'

  get 'become_seller', to: "users#become_seller", as: 'become_seller'
  patch 'update_user', to: "users#update", as: 'update_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :dashboard do
    resources :beverages
    resources :orders, only: %i[show destroy]
    get 'orders/:id/posted', to:"orders#posted", as: "order_posted"
  end


end
