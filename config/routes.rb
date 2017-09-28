Rails.application.routes.draw do

  root "home#index"
  
  resources :pets
  resources :jobs
end
