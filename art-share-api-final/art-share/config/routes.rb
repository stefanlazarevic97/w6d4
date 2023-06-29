Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, except: [:new, :edit]
  resources :artworks, except: [:new, :edit]
  resources :artwork_shares, only: [:create, :destroy]
end
