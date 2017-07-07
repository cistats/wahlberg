require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
# require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
# require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wahlberg
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl

      g.stylesheets     false
      g.javascripts     false
      g.helper          false
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.lograge.enabled = true
  end
end
