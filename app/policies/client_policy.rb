class ClientPolicy < HubScopedPolicy
  def create?
    current_hub_vendor?
  end

  def update?
    current_hub_vendor?
  end
end
