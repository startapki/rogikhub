class ClientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    Vendor.where(hub: @record.organization.hub, user: @user).exists?
  end

  def update?
    create?
  end
end
