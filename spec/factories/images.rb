FactoryGirl.define do
  factory :image do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/cover.png'), 'image/png') }

    trait :old do
      created_at { Time.zone.today - 1.week }
    end
  end
end
