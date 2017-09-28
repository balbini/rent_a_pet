Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'jobs#index'

  resources :jobs
  resources :pets


  get '/secret', to: 'jobs#secret', as: :secret

  resources :users, param: :slug
end
