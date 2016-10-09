FactoryGirl.define do
  factory :jingle do
    title { Faker::Lorem.word }
    user
    price_cents { 10_000 }
    price_currency { 'TRY' }
    audio
    image
  end
end
