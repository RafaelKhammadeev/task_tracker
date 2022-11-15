class TaskPolicy < ApplicationPolicy
  def index?
    member?
  end

  def show?
    member?
  end

  def new?
    create?
  end

  def create?
    member?
  end

  def edit?
    update?
  end

  def update?
    member?
  end

  def destroy?
    member?
  end

  private

  def member?
    record.project.project_memberships.find_by(user: user).present?
  end
end
