Rails.application.routes.draw do
  resources :hubs, only: %i(new create show)

  devise_for :users

  scope ':hub_path' do
  end

  root to: 'home#index'
end
