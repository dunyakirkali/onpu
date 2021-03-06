ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
require 'coveralls'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter])
SimpleCov.start 'rails' do
  add_group 'Policies', 'app/policies'
  add_group 'Decorators', 'app/decorators'
end
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'rspec/its'
require 'paperclip/matchers'
require 'money-rails/test_helpers'
require 'pundit/matchers'
require 'sidekiq/testing'

Sidekiq::Testing.inline!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.order = 'random'

  config.include AuthHelpers
  config.include Warden::Test::Helpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include AbstractController::Translation
  config.include Dropzone

  config.extend ControllerMacros, type: :controller

  config.before(:suite) do
    Warden.test_mode!
  end
end
