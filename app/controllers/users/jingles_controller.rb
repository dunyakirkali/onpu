# Users
module Users
  # JinglesController
  class JinglesController < ApplicationController
    layout false

    before_action :set_jingle, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, only: [:create, :update]
    protect_from_forgery only: [:create, :update] if Rails.env.test?

    def new
      @jingle = scope.build
    end

    def edit
    end

    def create
      @jingle = scope.build(jingle_params)
      set_jingles if @jingle.save
      render
    end

    def update
      set_jingles if @jingle.update(jingle_params)
    end

    def destroy
      set_jingles if @jingle.destroy
    end

    private

    def set_jingles
      @jingles = Jingle.includes(:user).page(params[:page])
    end

    def set_jingle
      @jingle = scope.friendly.find(params[:id])
    end

    def jingle_params
      params.require(:jingle).permit(:title, :price, :cover, :audio_id)
    end

    def scope
      current_user.jingles
    end
  end
end
