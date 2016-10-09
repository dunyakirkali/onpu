FactoryGirl.define do
  factory :image do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/cover.png'), 'image/png') }
  end
end
