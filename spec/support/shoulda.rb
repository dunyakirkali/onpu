RSpec.configure do |config|
  config.include Paperclip::Shoulda::Matchers
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
