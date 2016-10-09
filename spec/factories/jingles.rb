FactoryGirl.define do
  factory :jingle do
    title { Faker::Lorem.word }
    user
    cover { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/note.jpg'), 'image/jpg') }
    price_cents { 10_000 }
    price_currency { 'TRY' }
  end
end
