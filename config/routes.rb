Rails.application.routes.draw do
  resources :appliances
  resources :user_favs
  resources :locations
  devise_for :users
  resources :conversations
  resources :messages


  #fav related
  get '/users/fav', to: "users#my_favs", as: 'current_user_favs'
  get '/locations/:id/fav', to: "locations#add_to_fav"

  resources :users
  resources :feedbacks
  resources :reservations
  resources :equipments
  resources :categories
  resources :l_options
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html





  get 'hosting', to: "hosting#index"
  post 'hosting', to: "hosting#index"

  get 'host_space', to: "host_space#index"
  get 'host_space/locations', to: "host_space#locations"

  root to: 'application#index'

  get 'location_criterias', to: 'locations#searchCriteria'
end
