# Users
module Users
  # JinglesController
  class JinglesController < ApplicationController
    before_action :set_jingle, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, only: [:create, :update]

    def new
      @jingle = current_user.jingles.build
      render layout: false
    end

    def edit
      render layout: false
    end

    def create
      @jingle = current_user.jingles.build(jingle_params)
      respond_to do |format|
        if @jingle.save
          format.js do
            set_jingles
            render layout: false
          end
          format.html { redirect_to search_jingles_path, notice: 'Jingle was successfully created.' }
        else
          format.js { render layout: false }
        end
      end
    end

    def update
      respond_to do |format|
        if @jingle.update(jingle_params)
          format.js do
            set_jingles
            render layout: false
          end
          format.html { redirect_to search_jingles_path, notice: 'Jingle was successfully created.' }
        else
          format.js { render layout: false }
        end
      end
    end

    def destroy
      @jingle.destroy
      set_jingles
      redirect_to search_jingles_path, notice: 'Jingle was successfully destroyed.'
    end

    private

    def set_jingles
      @jingles = Jingle.all.includes(:user).page(params[:page])
    end

    def set_jingle
      @jingle = current_user.jingles.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jingle_params
      params.require(:jingle).permit(:title, :audio, :price, :cover)
    end
  end
end
