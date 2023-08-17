Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "expenses#index"

  resources :expenses
  resources :expenditures
  resources :users

  get '/homepage', to: 'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
