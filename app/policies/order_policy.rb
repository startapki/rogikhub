class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    @record.client.user == @user
  end

  def update?
    create?
  end
end
