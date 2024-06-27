Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "books#index"

  resources :books, only: %i[index create update destroy]
  resources :reservations, only: %i[index create update destroy]

  get 'users/profile', to: 'profile#show', as: :user_profile
  patch 'users/profile', to: 'profile#update', as: :update_user_profile
end
