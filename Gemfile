source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.1"

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft", "~> 1.1.0"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.5.9"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 6.5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails", "~> 1.3.1"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", "~> 2.0.11"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", "~> 1.3.4"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails", "~> 1.4.1"

# Use Tailwind CSS for stylesheets [https://tailwindcss.com]
gem "tailwindcss-rails"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 5.3.0"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.20"

# Use Devise for authentication
gem 'devise', '~> 4.9.4'
gem 'devise_invitable', '~> 2.0.9'

# Omniauth for OAuth
gem 'omniauth', '~> 2.1.2'
gem 'omniauth-azure-activedirectory-v2', '~> 2.1.0'
gem 'omniauth-rails_csrf_protection', '~> 1.0.2'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.13.0"

# Math and logic formula parser and evaluator [https://github.com/rubysolo/dentaku]
gem "dentaku", "~> 3.5.4"

# For Background Jobs - [https://resque.github.io/]
gem "resque", "~> 2.7.0"
gem "resque-scheduler", "~> 4.11.0"

# Karafka for Kafka
gem "karafka", "~> 2.2.7"

# Blueprinter for API response
gem "blueprinter", "~> 1.1.2"

# StoreModel
gem "store_model", "~> 4.2.0"

# Discard for soft deletes
gem "discard", "~> 1.4.0"

# Internal Gems for Relativity Platform
source "https://rubygems.pkg.github.com/tagntrac-infra" do
  gem "relativity_parsers", path: "/Users/vinayuttamvemparala/Documents/RPV2/relativity_parsers"

  # For accessing the device capabilities on IoT Core
  # gem 'relativity_iot_core', '1.0.0'

  # Platform Application Modules
  gem "track", path: "/Users/vinayuttamvemparala/Documents/Projects/track"
  gem "trail", path: "/Users/vinayuttamvemparala/Documents/Projects/trail"
  gem "trace", path: "/Users/vinayuttamvemparala/Documents/Projects/trace"
  gem "core", path: "/Users/vinayuttamvemparala/Documents/Projects/core"
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Pry for debugging
  gem "pry", "~> 0.15.2b"
  gem "pry-rails", "~> 0.3.11"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # Environment variables for local development
  gem "dotenv-rails"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end
