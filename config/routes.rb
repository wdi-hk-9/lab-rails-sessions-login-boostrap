Rails.application.routes.draw do

  get 'photos/index'

  get 'photos/show'

  get 'photos/new'

  get 'photos/create'

  get 'photos/update'

  get 'secret/public_info'

  get 'secret/secret'

  root "users#index"

  resources :photos

  resources :users, only: [:new, :index, :create]

  get 'login', to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]

  delete "/logout", to: "sessions#destroy"

end