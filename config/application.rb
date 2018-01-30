require_relative 'boot'

require 'rails/all'
require 'amazon/ecs'

Amazon::Ecs.configure do |options|
  options[:AWS_access_key_id] = 'AKIAJZZDZYTTQDXPLARQ'
  options[:AWS_secret_key] = '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'
  options[:associate_tag] = 'acots-20'
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bigproject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
