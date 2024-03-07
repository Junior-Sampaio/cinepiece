require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  mount Sidekiq::Web => '/sidekiq'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :rate_movies, only: [:create, :update]
  resources :movies, only: [:index, :new, :create]
  resources :user_movies, only: [:create, :update]

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  post '/movies/import', to: 'movies#import', as: 'import_movies'
  get 'rate-movies', to: 'rate_movies#rate_several_movies'

  root 'sessions#new'

end
