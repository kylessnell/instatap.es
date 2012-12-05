Mixtapes::Application.routes.draw do

  root to: 'static_pages#home'

  resources :static_pages, :only => :home
  resources :sessions, :only => [:create, :destroy]
  resources :users, :only => :index
  resources :facebook_users, :only => [:create, :destroy]
  resources :mixtapes, :only => [:new, :create, :show, :update]
  resources :searches, :only => :new
  resources :songs, :only => [:show, :new, :create]
  resources :designs, :only => :new
  resources :mixtapes_mailers, :only => :create
  
  
  match '/newsession', :to => 'sessions#create'
  match 'auth/:provider/callback', to: 'users#update'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match '/endsession', :to => 'sessions#destroy'
  match '/:url', :to => 'mixtapes#show', :as => "mixtape_play"
end
