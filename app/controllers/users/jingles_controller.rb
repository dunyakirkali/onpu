# Users
module Users
  # JinglesController
  class JinglesController < ApplicationController
    before_action :set_jingle, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def new
      @jingle = current_user.jingles.build
      render layout: false
    end

    def edit
    end

    def create
      @jingle = current_user.jingles.build(jingle_params)
      if @jingle.save
        respond_to do |format|
          format.js { render layout: false }
          format.html { redirect_to search_jingles_path, notice: 'Jingle was successfully created.' }
        end
      else
        render :new
      end
    end

    def update
      if @jingle.update(jingle_params)
        redirect_to search_jingles_path, notice: 'Jingle was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @jingle.destroy
      redirect_to search_jingles_path, notice: 'Jingle was successfully destroyed.'
    end

    private

    def set_jingle
      @jingle = current_user.jingles.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jingle_params
      params.require(:jingle).permit(:title, :audio, :price)
    end
  end
end
