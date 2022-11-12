class CommentPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def update?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def edit?
    true
  end
end
