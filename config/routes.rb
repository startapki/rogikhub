Rails.application.routes.draw do
  resources :hubs, only: %i(new create show)

  devise_for :users

  scope ':hub_path' do
    resources :organizations, shallow: true, only: %i(index new create) do
      resources :clients, only: %i(new create)
    end
  end

  root to: 'home#index'
end
