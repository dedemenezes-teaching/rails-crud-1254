Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # List all restaurants
  get '/restaurants', to: 'restaurants#index'

  # 2. receive the form submission
  post '/restaurants', to: 'restaurants#create'

  # Create a restaurant
  # 1. see the form
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant

    # Update a restaraunt
  # 1. see the form
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant

  # See one restaurant
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant
  # 2. receive the edit form
  patch '/restaurants/:id', to: 'restaurants#update'

  # Delete a restaurant
  delete '/restaurants/:id', to: 'restaurants#destroy'

  # DONT USE IT TODAY!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # resources :restaurants, only: [:index, :show]
end
