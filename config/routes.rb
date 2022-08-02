Rails.application.routes.draw do
  resources :categories
  resources :deals
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'splash#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
