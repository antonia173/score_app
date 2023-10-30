Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "competitions#index"
  resources :competitions

  get '/users/:id/matches', to: 'users#show', as: 'user_matches'

  get '/matches/:id/edit', to: 'matches#edit', as: 'edit_matches'
  patch '/matches/:id', to: 'matches#update', as: 'update_matches'

  get '/auth/auth0/callback', to: 'auth0#callback'
  get '/auth/failure', to: 'auth0#failure'
  get '/auth/logout', to: 'auth0#logout'
end
