Rails.application.routes.draw do

  get 'attractions/index'

  root to: 'welcome#home'
  get '/signin', to: 'welcome#signin', as: 'signin'
  post 'signin', to: 'welcome#create'
  delete '/signout', to: 'welcome#signout', as: 'signout'
  
  resources :users
  resources :attractions, only: [:index, :show]
  
  patch 'ride/new', to: 'rides#create'
end
