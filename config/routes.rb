Rails.application.routes.draw do
  devise_for :users

  resources :hubs, param: :path, path: '', only: %i(new create)

  scope ':path' do
    resources :organizations, shallow: true, only: %i(index new create) do
      resources :clients, only: %i(new create)
    end

    namespace :clients do
      resources :orders, except: :show
    end

    get '/', to: 'hub_scoped#index', as: :hub
  end

  root to: 'hubs#index'
end
