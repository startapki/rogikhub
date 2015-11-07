class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def edit?
    create? && @record.items.where('status_id IS NOT NULL').empty?
  end

  def create?
    @record.client.user == @user
  end

  def update?
    create?
  end

  def destroy?
    edit?
  end
end
