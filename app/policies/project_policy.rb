class ProjectPolicy < ApplicationPolicy
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
    true
  end

  def update?
    record.project_memberships.find_by(user_id: user).role == "member"
  end

  def destroy?
    record.project_memberships.find_by(user_id: user).role == "owner"
  end
end
