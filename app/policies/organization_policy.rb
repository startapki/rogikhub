class OrganizationPolicy < HubScopedPolicy
  def index?
    current_hub_vendor?
  end

  def create?
    current_hub_vendor?
  end

  def update?
    current_hub_vendor?
  end
end
