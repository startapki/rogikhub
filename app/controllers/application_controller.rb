class ApplicationController < ActionController::Base
  include DeviseConfiguration

  protect_from_forgery with: :exception

  def additional_devise_permitted_params
    { account_update: [:name], sign_up: [:name] }
  end
end
