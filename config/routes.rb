Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  # get 'pages/index'
  get 'pages/help'
  
  resources :users

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # get 'sessions/new'

  # get  'calendars/index'
  # get  'calendars/new'
  # post '/calendars', to: 'calendars#create'
  resources :calendars
  
  # get  'items/index'
  # get  'items/new'
  # post '/items', to: 'items#create'
  
  resources :items
end
