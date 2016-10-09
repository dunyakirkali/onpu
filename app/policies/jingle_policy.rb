# JinglePolicy
class JinglePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present?
        user.jingles
      else
        scope.none
      end
    end
  end

  def edit?
    return false if user.nil?
    record.user == user
  end

  def buy?
    true
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    return false if user.nil?
    record.user == user
  end

  def destroy?
    return false if user.nil?
    record.user == user
  end
end
