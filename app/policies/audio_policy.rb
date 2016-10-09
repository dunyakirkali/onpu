# AudioPolicy
class AudioPolicy < ApplicationPolicy
  attr_reader :user, :audio

  def initialize(user, audio)
    @user = user
    @audio = audio
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end
end
