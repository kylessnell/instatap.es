Mixtapes::Application.routes.draw do

  get 'mixtapes/index'
  post 'mixtapes/new'
  get 'mixtapes/search'

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  root to: 'users#index'
end
