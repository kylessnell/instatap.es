Mixtapes::Application.routes.draw do
  get "static_pages/home"

  #match 'auth/:provider/callback', to: 'sessions#create'
  #match 'auth/failure', to: redirect('/')
  #match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, :only => [:create, :destroy]
  resources :users, :only => :index

  match '/newsession', :to => 'sessions#create'
  match '/endsession', :to => 'static_pages#home'

  resources :mixtapes, :only => [:index, :new, :create]
  resources :songs, :only => [:show, :new, :create]
  get 'mixtapes/search'

  root to: 'static_pages#home'

end
