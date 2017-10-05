Rails.application.routes.draw do
  ### chat start
  # Mount the Action Cable server on a sub-URI of our main application.
  # Action Cable will be listening for WebSocket requests on ws://localhost:3000/cable. It will do so by using the Rack socket hijacking API. When our main application is instantiated, an instance of Action Cable will also be created. Action Cable will, per our instructions in the routes.rb file, establish a WebSocket connection on localhost:3000/cable, and begin listening for socket requests on that URI.
  mount ActionCable.server => '/cable'
  ### chat end

  # devise_for :users
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  resources :jobs do
    collection do
      get :autocomplete
    end
  end

  resources :pets
  get '/all', to: 'jobs#all', as: :all

  get '/secret', to: 'jobs#secret', as: :secret
  get '/show_all_jobs', to: 'jobs#show_all_jobs'

  resources :users, param: :slug do
    resources :chatrooms, only: [:index, :show, :create]
  end

  resources :messages, only:[:create]

end
