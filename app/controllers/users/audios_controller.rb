# Users
module Users
  # AudiosController
  class AudiosController < ApplicationController
    before_action :set_jingle
    before_action :set_audio, only: [:show, :edit, :update]
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, only: [:create, :update]
    protect_from_forgery only: [:create, :update] if Rails.env.test?

    def new
      @audio = @jingle.build_audio
    end

    def edit
    end

    private

    def set_jingle
      @jingle = Jingle.friendly.find(params[:jingle_id])
    end

    def set_audio
      @audio = @jingle.audio
    end
  end
end
