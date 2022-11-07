class TaskPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def index?
    show?
  end

  def show?
    record.project_memberships.find_by(user: user).present?
  end

  def new?
    show?
  end

  def create?
    show?
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end
end
