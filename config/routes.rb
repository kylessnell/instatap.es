Mixtapes::Application.routes.draw do

  get "static_pages/home"

  resources :songs, :only => [:show, :new, :create]
  resources :mixtapes, :only => [:new, :create, :show, :update] do
    collection do
      get 'search'
    end
  end

  resources :designs, :only => :new
  resources :sessions, :only => [:create, :destroy]
  resources :users, :only => :index
  resources :mixtapes_mailers, :only => :create

  match '/newsession', :to => 'sessions#create'
  match '/endsession', :to => 'sessions#destroy'
  match '/:url', :to => 'mixtapes#show', :as => "mixtape_play"
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  root to: 'static_pages#home'

end
