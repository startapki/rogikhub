Rails.application.routes.draw do
  resources :hubs, only: %i(new create show)

  devise_for :users

  root to: 'home#index'
end
