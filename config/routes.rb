Rails.application.routes.draw do

  get 'pages/everyone'
  get 'pages/logged_in'
  get 'pages/user_only'

  root "users#index"
  get 'login', to: 'sessions#new'
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :photos
  resources :sessions, only: [:new, :create, :destroy]

end
