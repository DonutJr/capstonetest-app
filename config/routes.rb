Rails.application.routes.draw do

  get '/' => 'pages#index'

  get '/coins' => 'coins#index'
  get '/coins/:id' =>'coins#show'

  get '/prices' => 'prices#index'

  get '/trades' => 'trades#index'
  get '/trades/new' => 'trades#new'
  post '/trades' => 'trades#create'
  get '/trades/:id/edit' => 'trades#edit'
  patch '/trades/:id' => 'trades#update'
  delete '/trades/:id' => 'trades#destroy'

  get '/wallets' => 'wallets#index'

  namespace :api do
    namespace :v1 do
      get '/wallets' => 'wallets#index'
      post '/wallets' => 'wallets#create'
      delete '/wallets/:id' => 'wallets#destroy'
    end
  end


  get '/alerts' => 'pings#index'
  get '/alerts/new' => 'pings#new'
  post '/alerts' => 'pings#create' 
  delete '/alerts/:id' => 'pings#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  patch '/users/:id' => 'users#update'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
