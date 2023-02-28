Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  #devise_for :users
  root to: 'posts#index'

  #establish restroutes resources
  resources :posts
  resources :profiles
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
