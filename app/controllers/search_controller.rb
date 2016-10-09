# SearchController
class SearchController < ApplicationController
  def jingles
    @jingles = Jingle.includes(:user, :image).where('title LIKE ?', "%#{params[:query]}%").page(params[:page])
    respond_to do |format|
      format.js { render layout: false }
      format.html { render 'jingles/index' }
    end
  end
end
