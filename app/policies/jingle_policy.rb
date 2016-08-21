# JinglePolicy
class JinglePolicy < ApplicationPolicy
  attr_reader :user, :jingle

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

  def destroy?
    return false if user.nil?
    jingle.user == user
  end
end
