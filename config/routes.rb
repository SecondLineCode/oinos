Rails.application.routes.draw do
  resources :wines

  resources :varietals

  resources :appellations

  resources :vineyards

  get 'pages/search'

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
