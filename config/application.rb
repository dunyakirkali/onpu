require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Onpu
  class Application < Rails::Application
    # Time zone
    config.time_zone = 'Istanbul'

    # Locale
    config.i18n.enforce_available_locales = false
    config.i18n.available_locales = [:tr, :en]
    config.i18n.default_locale = :tr

    config.active_job.queue_adapter = :sidekiq

    config.action_dispatch.rescue_responses['Pundit::NotAuthorizedError'] = :forbidden

    config.middleware.use Rack::Attack
  end
end
