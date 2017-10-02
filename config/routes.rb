Rails.application.routes.draw do

  
  get '/' => 'coins#index'

  get '/trades' => 'trades#index'

  get '/trades/new' => 'trades#new'
  post '/trades' => 'trades#create'


  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
