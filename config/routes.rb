Rails.application.routes.draw do
  resources :rides
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end