# Users
module Users
  # AudiosController
  class AudiosController < Users::ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, only: :create
    protect_from_forgery only: :create if Rails.env.test?

    def new
      @audio = Audio.new
      authorize @audio
    end

    def create
      @audio = Audio.new(audio_params)
      authorize @audio
      @audio.save
      render layout: false
    end

    private

    def audio_params
      params.require(:audio).permit(:file)
    end
  end
end
