FactoryGirl.define do
  factory :jingle do
    title { Faker::Lorem.word }
    user
    audio { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/audio.mp3'), 'audio/mp3') }
    price_cents { 10_000 }
    price_currency { 'TRY' }
  end
end
