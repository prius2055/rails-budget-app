Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")

  authenticated :user do
    root 'expenses#index', as: :authenticated_root
  end

  unauthenticated do
    root "homepage#index", as: :unauthenticated_root
  end

  resources :expenses
  resources :expenditures
  resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
