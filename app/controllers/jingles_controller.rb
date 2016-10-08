# JinglesController
class JinglesController < ApplicationController
  before_action :set_jingle, only: [:buy, :show]
  before_action :authenticate_user!

  def buy
    render layout: false
  end

  def show
  end

  private

  def set_jingle
    @jingle = Jingle.friendly.find(params[:id])
  end
end
