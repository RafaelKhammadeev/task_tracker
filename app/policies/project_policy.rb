class ProjectPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def index?
    true
  end

  def new?
    user.present?
  end

  def create?
    new?
  end
end
