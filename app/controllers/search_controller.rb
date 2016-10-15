# SearchController
class SearchController < ApplicationController
  def jingles
    @jingles = Jingle.includes(:image).where('title LIKE ?', "%#{params[:query]}%")
    respond_to do |format|
      format.js { render layout: false }
      format.html { render 'jingles/index' }
    end
  end
end
