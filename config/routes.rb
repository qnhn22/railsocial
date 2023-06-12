Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:edit, :update, :create, :destroy]
  end

  resources :friendships, only: [:create, :destroy]
  resources :invitations, only: [:new, :create, :destroy]

  resources :users, only: [:show]
  resources :profiles, except: [:index]
  # Defines the root path route ("/")
  root "posts#index"
end
