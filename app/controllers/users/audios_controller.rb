# Users
module Users
  # AudiosController
  class AudiosController < ApplicationController
    before_action :set_audio, only: [:show, :edit, :update]
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, only: [:create, :update]
    protect_from_forgery only: [:create, :update] if Rails.env.test?

    def new
      @audio = Audio.new
    end

    def edit
    end

    def create
      @audio = Audio.new(audio_params)
      @audio.save
      render layout: false
    end

    private

    def set_audio
      @audio = Audio.find(params[:id])
    end

    def audio_params
      params.require(:audio).permit(:file)
    end
  end
end
