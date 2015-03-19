Rails.application.routes.draw do
  get 'pages/search'

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
