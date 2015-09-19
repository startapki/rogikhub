class HubScopedController < ApplicationController
  after_action :verify_authorized, except: :index

  helper_method :current_hub, :current_client, :current_vendor

  def index
  end

  private

  def current_hub
    @current_hub ||= Hub.find_by!(path: params[:path])
  end

  def current_client
    @current_client ||= current_hub.clients.find_by(user: current_user)
  end

  def current_organization
    @current_organization ||= current_client.organization
  end

  def current_vendor
    @current_vendor ||= current_hub.vendors.find_by(user: current_user)
  end

  def default_url_options(*)
    { path: current_hub }
  end
end
