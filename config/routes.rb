Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :bands
  resources :albums
  resources :tracks
  resources :notes, only: [:create, :destroy]

  get 'users/purgatory', to: 'users#purgatory', as: :purgatory
  get 'users/activate', to: 'users#activate', as: :activate

  get 'search/albums', to: 'albums#search', as: :album_search
  get 'search/tracks', to: 'tracks#search', as: :track_search
  get 'search/bands', to: 'bands#search', as: :band_search

  post '/search', to: 'searches#search', as: :search_router

  root 'bands#index'

end
