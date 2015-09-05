class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def additional_devise_permitted_params
    { account_update: [:name], sign_up: [:name] }
  end
end
