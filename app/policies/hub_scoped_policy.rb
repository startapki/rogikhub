class HubScopedPolicy < ApplicationPolicy
  attr_reader :current_hub

  def with_hub(hub)
    @current_hub = hub
    self
  end

  private

  def current_hub_vendor?
    Vendor.where(hub: current_hub, user: @user).exists?
  end

  def current_hub_client?
    Client.joins(:organization)
          .where(organizations: { hub_id: current_hub.id })
          .where(user: @user).exists?
  end
end
