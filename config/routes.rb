Rails.application.routes.draw do
  get 'myaccount/index'
  get 'admin' => 'admin#index'
  post 'myaccount/update'
  resources :myaccount, :househunters
 # resources :signup
 # resources :signin
  match ':controller(/:action(/:id))', :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
