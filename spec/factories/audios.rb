FactoryGirl.define do
  factory :audio do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/audio.mp3'), 'audio/mp3') }
  end
end
