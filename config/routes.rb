Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :bands
  resources :albums
  resources :tracks
  resources :notes, only: [:create, :destroy]

  get '/users/purgatory', to: 'users#purgatory', as: :purgatory
  get '/users/activate', to: 'users#activate', as: :activate

  root 'bands#index'

end
