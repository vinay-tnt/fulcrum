require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fulcrum
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Custom path for asset pipeline
    config.assets.prefix = "/rp-assets"

    # Prepend all log lines with the following tags.
    config.log_tags = [ ->(_req) { DateTime.now.to_time.utc }, :request_id, :remote_ip ]

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Configure generators
    config.generators do |g|
      # Use UUID as primary key for all models
      g.orm :active_record, primary_key_type: :uuid
    end

    # Config to support sub-domain
    config.action_dispatch.tld_length = ENV.fetch("RP_TLD_LENGTH", 1).to_i

    # Allowed Hosts
    config.hosts << ENV.fetch("RP_ALLOWED_HOSTS", nil)

    # Configure Cache Store
    cache_store_url = "#{ENV.fetch('RP_APP_REDIS_HOST', nil)}:#{ENV.fetch('RP_APP_REDIS_PORT', nil)}"
    config.cache_store = :redis_cache_store, { url: cache_store_url }
  end
end
