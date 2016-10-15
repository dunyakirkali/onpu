require 'capybara/poltergeist'
Capybara.register_driver :poltergeist do |app|
  options = {
    screen_size: [1600, 1200]
  }
  Capybara::Poltergeist::Driver.new(app, options)
end
Capybara.javascript_driver = :poltergeist
Capybara.raise_server_errors = false
