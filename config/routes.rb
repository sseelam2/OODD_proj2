Rails.application.routes.draw do
  get 'messages/index'
  resources :companies, :realtors, :house_hunters, :houses, :messages
  get 'house_hunters/index'
  get 'realtors/index'
  get 'houses/index'
  get 'companies/index'
  get 'myaccount/index'
  get 'admin' => 'admin#index'
  match ':controller(/:action(/:id))', :via => [:get, :post]
  post 'myaccount/update'
  resources :myaccount, :househunters
 # resources :signup
 # resources :signin
  match ':controller(/:action(/:id))', :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
