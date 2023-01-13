Rails.application.routes.draw do
  resources :images
  resources :image_sets
  resources :maps
  root "maps#index"
  get "/maps", to: "maps#index"

  get '/get_image_sets', to: 'images#get_image_sets'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
