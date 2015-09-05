class HomeController < ApplicationController
  def index
    hub = current_user.vendors.first.try(:hub)
    if hub.present?
      redirect_to hub
    else
      redirect_to new_hub_path
    end
  end
end
