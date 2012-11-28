Mixtapes::Application.routes.draw do
  #match 'auth/:provider/callback', to: 'sessions#create'
  #match 'auth/failure', to: redirect('/')
  #match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  match '/newsession', :to => 'sessions#create'
  match '/endsession', :to => 'sessions#destroy'
  root to: 'users#index'
end
