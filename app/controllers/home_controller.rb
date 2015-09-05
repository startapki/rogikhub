class HomeController < ApplicationController
  def index
    return if current_user.nil?
    if current_hub.present?
      redirect_to organizations_path(current_hub)
    else
      redirect_to new_hub_path
    end
  end

  private

  def current_hub
    return if current_user.nil?
    current_user.vendors.first.try(:hub) || current_user.clients.first.try(:hub)
  end
end
