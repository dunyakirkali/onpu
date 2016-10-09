FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }

    trait :with_jingels do
      after(:create) do |user|
        create(:jingle, user: user)
      end
    end
  end
end
