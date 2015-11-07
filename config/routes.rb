Rails.application.routes.draw do
  devise_for :users

  resources :hubs, param: :path, path: '', only: %i(new create)

  scope ':path' do
      resources :clients, only: %i(new create)
    resources :organizations, except: %i(show) do
    end

    namespace :clients do
      resources :orders, except: :show
    end

    namespace :vendors do
      resources :orders, only: :index
    end

    get '/', to: 'hub_scoped#index', as: :hub
  end

  root to: 'hubs#index'
end
