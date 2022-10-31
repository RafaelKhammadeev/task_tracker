class SessionPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def show?
    !create?
  end

  def new?
    create?
  end

  # если не залогинен
  def create?
    user.blank?
  end

  # разлогиниться, если залогинен
  def destroy?
    user.present?
  end
end
