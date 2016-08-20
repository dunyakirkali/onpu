FactoryGirl.define do
  factory :jingle do
    title { Faker::Lorem.word }
    user
  end
end
