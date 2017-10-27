Rails.application.routes.draw do

  get 'notes/new'

  get 'notes/create'

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :bands
  resources :albums
  resources :tracks
  resources :notes, only: [:create, :destroy]

end
