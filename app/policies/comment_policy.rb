class CommentPolicy < ApplicationPolicy
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

  private

  def user_exist?
    user.present?
  end
end
