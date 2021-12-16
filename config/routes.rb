Rails.application.routes.draw do
  devise_for :users
  resources :conversations
  resources :messages
  resources :users
  resources :feedbacks
  resources :reservations
  resources :locations
  resources :equipment
  resources :categories
  resources :l_options
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'application#index'
end
