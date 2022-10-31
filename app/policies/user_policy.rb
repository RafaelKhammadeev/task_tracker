class UserPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def new?
    create?
  end

  # может зарегестрировать, если раньше не был
  def create?
    user.blank?
  end
end
