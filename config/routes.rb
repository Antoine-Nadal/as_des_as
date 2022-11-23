Rails.application.routes.draw do
  devise_for :users
  root to: "gaming_sessions#index"

  resources :gaming_sessions do
    resources :bookings, only: %i[create]
  end
  get 'dashboard', to: 'pages#dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "gamesessions#index"
end
