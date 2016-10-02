# JinglesController
class JinglesController < ApplicationController
  before_action :set_jingle, only: [:buy, :show]
  before_action :authenticate_user!

  def buy
    redirect_to search_jingles_path, notice: 'Jingle was bought.'
  end

  def show
  end

  private

  def set_jingle
    @jingle = Jingle.friendly.find(params[:id])
  end
end
