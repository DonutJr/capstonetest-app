Rails.application.routes.draw do

  
  get '/' => 'coins#index'
  get '/coins/:id' =>'coins#show'

  
  get '/trades' => 'trades#index'
  get '/trades/new' => 'trades#new'
  post '/trades' => 'trades#create'
  get '/trades/:id' => 'trades#show'
  get '/trades/:id/edit' => 'trades#edit'
  patch '/trades/:id' => 'trades#update'
  delete '/trades/:id' => 'trades#destroy'



  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/wallets' => 'wallets#index'
  get '/wallets/new' => 'wallets#new'
  post '/wallets' => 'wallets#create'
  get '/wallets/:id' => 'wallets#show'
  get '/wallets/:id/edit' => 'wallets#edit'
  patch '/wallets/:id' => 'wallets#update'
  delete '/wallets/:id' => 'wallets#destroy'



end
