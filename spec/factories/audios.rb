FactoryGirl.define do
  factory :audio do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/audio.mp3'), 'audio/mp3') }

    trait :old do
      created_at { Time.zone.today - 1.week }
    end
  end
end
