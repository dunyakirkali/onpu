# Users
module Users
  # AudiosController
  class AudiosController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, only: :create
    protect_from_forgery only: :create if Rails.env.test?

    def new
      @audio = Audio.new
    end

    def create
      @audio = Audio.new(audio_params)
      @audio.save
      render layout: false
    end

    private

    def audio_params
      params.require(:audio).permit(:file)
    end
  end
end
