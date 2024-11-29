Rails.application.routes.draw do
  get 'messages/create'
  get 'chats/create'
  get 'chats/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "books#index"

  resources :books, only: %i[index new create edit update show destroy] do 
    collection do
      get 'my_books' # This defines the route for my_books
    end
  end
  resources :reservations, only: %i[index new create edit update show destroy]

  get 'users/profile', to: 'profile#show', as: :user_profile
  patch 'users/profile', to: 'profile#update', as: :update_user_profile

  resources :chats, only: %i[index create show] do 
    resources :messages, only: %i[index new create]
  end
end
