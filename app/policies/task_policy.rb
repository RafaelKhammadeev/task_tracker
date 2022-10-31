class TaskPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.present?
  end

  def edit
    true
  end

  def update
    true
  end

  def destroy?
    true
  end
end
