Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  resources :jobs
  resources :pets
  resources :users, param: :slug

  get '/secret', to: 'jobs#secret', as: :secret
end
