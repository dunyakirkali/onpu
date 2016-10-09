# JinglePolicy
class JinglePolicy < ApplicationPolicy
  attr_reader :user, :jingle

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.present?
        user.jingles
      else
        scope.none
      end
    end
  end

  def initialize(user, jingle)
    @user = user
    @jingle = jingle
  end

  def edit?
    return false if user.nil?
    jingle.user == user
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
    jingle.user == user
  end

  def destroy?
    return false if user.nil?
    jingle.user == user
  end
end
