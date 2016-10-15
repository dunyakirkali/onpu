# Users
module Users
  # JinglesController
  class JinglesController < Users::ApplicationController
    layout false

    before_action :set_jingle, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, only: [:create, :update]
    after_action :verify_policy_scoped, only: [:new, :create, :show, :edit, :update]
    protect_from_forgery only: [:create, :update] if Rails.env.test?

    def new
      @jingle = policy_scope(Jingle).build
      authorize @jingle
      @jingle.build_image
    end

    def edit
      authorize @jingle
    end

    def create
      @jingle = policy_scope(Jingle).build(jingle_params)
      authorize @jingle
      set_jingles if @jingle.save
      render
    end

    def update
      authorize @jingle
      set_jingles if @jingle.update(jingle_params)
      render
    end

    def destroy
      authorize @jingle
      set_jingles if @jingle.destroy
    end

    private

    def set_jingles
      @jingles = Jingle.includes(:user)
    end

    def set_jingle
      @jingle = policy_scope(Jingle).friendly.find(params[:id])
    end

    def jingle_params
      params.require(:jingle).permit(:title, :price, :audio_id, image_attributes: [:id, :file])
    end
  end
end
