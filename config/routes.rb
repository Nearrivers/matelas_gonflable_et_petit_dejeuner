Rails.application.routes.draw do
  resources :reservations_options
  resources :options
  resources :feedbacks
  resources :reservations
  resources :location_appliances
  resources :appliances
  resources :user_favs
  resources :locations
  devise_for :users
  resources :conversations
  resources :messages

  #fav related
  get '/users/fav', to: "users#my_favs", as: 'current_user_favs'
  get '/locations/:id/fav', to: "locations#add_to_fav", as: "add_to_fav"

  resources :users
  resources :reservations
  resources :equipments
  resources :categories
  resources :l_options
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'hosting', to: "hosting#index"
  post 'hosting', to: "hosting#index"

  get 'host_space', to: "host_space#index"
  get 'host_space/locations', to: "host_space#locations"
  get 'host_space/locations/:id/reservations', to: "host_space#locations_reservations", as: 'locations_reservations'
  post 'host_space/reservations/accept', to: "host_space#accept_reservation", as: 'accept_reservation'
  post 'host_space/reservations/decline', to: "host_space#decline_reservation", as: 'decline_reservation'

  root to: 'application#index'

  get 'location_criterias', to: 'locations#searchCriteria'
end
