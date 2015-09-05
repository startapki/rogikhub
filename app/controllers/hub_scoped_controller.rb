class HubScopedController < ApplicationController
  helper_method :current_hub

  private

  def current_hub
    @current_hub ||= Hub.find_by!(path: params[:hub_path])
  end

  def current_client
    @current_client ||= current_hub.clients.find_by!(user: current_user)
  end

  def current_organization
    @current_organization ||= current_client.organization
  end

  def current_vendor
    @current_vendor ||= current_hub.vendors.find_by!(user: current_user)
  end

  def default_url_options(*)
    { hub_path: current_hub.path }
  end
end
