class ApplicationController < ActionController::Base
  include DeviseConfiguration
  include Pundit

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def additional_devise_permitted_params
    { account_update: [:name], sign_up: [:name] }
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
