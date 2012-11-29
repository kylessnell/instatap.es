Mixtapes::Application.routes.draw do
  get "static_pages/home"

  #match 'auth/:provider/callback', to: 'sessions#create'
  #match 'auth/failure', to: redirect('/')
  #match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, :only => [:create, :destroy]
  resources :users, :only => :index
  resources :mixtapes_mailers, :only => :create

  match '/newsession', :to => 'sessions#create'
  match '/endsession', :to => 'static_pages#home'
  match '/:mixtape_url', :to => 'mixtapes#show'

  resources :mixtapes, :only => [:index, :new, :create, :show]
  resources :songs, :only => [:show]
  get 'mixtapes/search'

  root to: 'static_pages#home'
  
end
