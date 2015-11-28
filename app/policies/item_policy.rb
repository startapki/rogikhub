class ItemPolicy < HubScopedPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def update?
    @record.order.client.try(:user) == @user || @user.vendor?
  end
end
