Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  # resources :jobs
  resources :jobs do
    collection do
      get :autocomplete
    end
  end

  resources :pets
  resources :users, param: :slug
  get '/all', to: 'jobs#all', as: :all

  get '/secret', to: 'jobs#secret', as: :secret
  get '/show_all_jobs', to: 'jobs#show_all_jobs'

  resources :chatrooms, param: :slug
  resources :messages
end
