Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  get 'messages/index'
  resources :companies, :realtors, :house_hunters, :houses, :messages, :searches
  get 'house_hunters/index'
  get 'realtors/index'
  get 'houses/index'
  get 'companies/index'
  get 'myaccount/index'
  get 'photos/new'
  get 'photos/create'
  get 'admin' => 'admin#index'
  match ':controller(/:action(/:id))', :via => [:get, :post]
  post 'myaccount/update'
  resources :myaccount, :househunters
  # resources :signup
  # resources :signin
  match ':controller(/:action(/:id))', :via => [:get, :post]
  root to: "signin#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
