class HubPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:vendors, organizations: :clients)
        .where('vendors.user_id = :user_id OR clients.user_id = :user_id',
               user_id: @user.try(:id))
    end
  end

  def create?
    @record.vendors.map(&:user).include?(@user)
  end

  def update?
    Vendor.where(hub: @record, user: @user).exists?
  end
end
