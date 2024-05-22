Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'theatres/index'
  get 'theatres/show'
  get 'theatres/new'
  get 'theatres/create'
  get 'movies/index'
  get 'movies/show'
  get 'movies/new'
  get 'movies/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :movies, only: [:index, :show, :new, :create]
  resources :theatres, only: [:index, :show, :new, :create]
  resources :bookings, only: [:new, :create]
  root 'movies#index'
  # Defines the root path route ("/")
  # root "posts#index"
end
