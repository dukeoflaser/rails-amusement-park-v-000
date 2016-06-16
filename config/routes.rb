Rails.application.routes.draw do

  root to: 'welcome#home'
  get '/signin', to: 'welcome#signin', as: 'signin'
  resources :users
end
