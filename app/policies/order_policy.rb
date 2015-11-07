class OrderPolicy < HubScopedPolicy
  def new?
    current_hub_client?
  end

  def edit?
    create? && @record.items.where('status_id IS NOT NULL').empty?
  end

  def create?
    @record.client.user == @user
  end

  def update?
    @record.client.user == @user
  end

  def destroy?
    edit?
  end
end
