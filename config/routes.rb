Rails.application.routes.draw do
  resources :rides do
    resources :bookings
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end