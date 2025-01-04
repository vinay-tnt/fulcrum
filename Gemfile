source "https://rubygems.org"

ruby "3.3.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.1"

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft", "~> 1.1.0"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.5.9"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails", "~> 1.3.1"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", "~> 2.0.11"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", "~> 1.3.4"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails", "~> 1.4.1"

# A utility-first CSS framework for rapidly building custom designs [https://tailwindcss.com]
gem "tailwindcss-rails", "~> 3.1.0"

# Use Redis adapter to run Action Cable in production and caching [https://github.com/redis/redis-rb]
gem "redis", "~> 5.3.0"

# Row-level multitenancy for Ruby on Rails apps. [https://github.com/ErwinM/acts_as_tenant]
gem "acts_as_tenant", "~> 1.0.1"

# Helper methods for rendering SVG in rails applications [https://github.com/jamesmartin/inline_svg]
gem "inline_svg", "~> 1.10.0"

# Pass data from Rails to JavaScript [https://github.com/gazay/gon]
gem "gon", "~> 6.4.0"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.20"

# Use Devise for authentication
gem "devise", "~> 4.9.4"
gem "devise_invitable", "~> 2.0.9"

# Omniauth for OAuth and Microsoft Azure AD
gem "omniauth", "~> 2.1.2"
gem "omniauth-entra-id", "~> 3.0.1"
gem "omniauth-rails_csrf_protection", "~> 1.0.2"

# Work with JSON-backed attributes as ActiveRecord-ish models [https://github.com/DmitryTsepelev/store_model]
gem "store_model", "~> 4.2.0"

# For Background Jobs
gem "resque", "~> 2.7.0"
gem "resque-scheduler", "~> 4.11.0"

# To parser linear equations for alert
gem "dentaku", "~> 3.5.4"

# Karafka for interfacing with Kafka Cluster
gem "karafka", "~> 2.2.7"

# JWT for token based authentication
gem "jwt", "~> 2.7.1"

# Kaminari for pagination
gem "kaminari", "~> 1.2.2"

# Blueprinter for API response
gem "blueprinter", "~> 1.1.2"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.13.0"

source "https://rubygems.pkg.github.com/tagntrac-infra" do
  # For parsing binary data from AOVX devices
  gem "relativity_parsers", "2.0.0"

  # For accessing the device capabilities on IoT Core
  # gem 'relativity_iot_core', '1.0.0'
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end
