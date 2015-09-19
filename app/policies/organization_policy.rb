class OrganizationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    Vendor.where(hub: @record.hub, user: @user).exists?
  end
end