Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy] do
      member do
        post "reply"
      end
    end
  end

  resources :friendships, only: [:create, :destroy]
  resources :invitations, only: [:new, :create, :destroy]
  resources :commentships, only: [:create]

  resources :profiles, except: [:index]
  resources :users
  # Defines the root path route ("/")
  root "posts#index"
end
