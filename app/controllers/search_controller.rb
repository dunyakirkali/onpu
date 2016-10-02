class SearchController < ApplicationController
  layout false

  def jingles
    @jingles = Jingle.all.includes(:user).where("title LIKE ?", "%#{params[:query]}%").page(params[:page])
  end
end
