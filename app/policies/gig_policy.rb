class GigPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    user.present? && record.user == user
  end

  def destroy?
    user.present? && record.user_id == user.id
  end
end
