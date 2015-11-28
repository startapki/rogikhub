Rails.application.routes.draw do
  devise_for :users

  resources :hubs, param: :path, path: '', only: %i(new create)

  scope ':path' do
    resources :organizations, except: %i(show) do
      resources :clients, except: %i(index, show)
    end

    namespace :clients do
      resources :orders, except: :show
    end

    namespace :vendors do
      resources :orders, only: :index
      resources :items, only: :update
    end

    get '/', to: 'hub_scoped#index', as: :hub
  end

  root to: 'hubs#index'
end
