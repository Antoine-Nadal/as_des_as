Rails.application.routes.draw do
  devise_for :users
  root to: "gaming_sessions#index"

  resources :gaming_sessions do
    resources :bookings, only: %i[create]
  end
  resources :bookings, only: [] do
    member do
      get :accept
      get :refuse
    end
  end
  # get 'dashboard', to: 'pages#dashboard'
  get 'dashboard', to: 'bookings#dashboard'
  # patch 'dashboard/:id', to: 'bookings#accept'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # root "gamesessions#index"
end
