# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.3.1"

gem "propshaft"
gem "puma", ">= 5.0"
gem "rails", "~> 7.1", ">= 7.1.3.4"
gem "sqlite3"

gem "cssbundling-rails"
gem "jsbundling-rails"
gem "stimulus-rails"
gem "turbo-rails"

gem "aws-sdk-s3", require: false
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "csv"
gem "image_processing", "~> 1.2"
gem "jbuilder"
gem "litestack"
gem "pagy"

group :development, :test do
  gem "brakeman", "~> 6.1"
  gem "bundler-audit", "~> 0.9.1"
  gem "debug", platforms: %i[mri windows]
end

group :development do
  gem "authentication-zero", "~> 3.0"
  gem "dockerfile-rails", ">= 1.6", require: false
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "web-console"
  # gem "rack-mini-profiler"
  # gem "spring"
end

group :production do
  gem "sentry-rails"
  gem "sentry-ruby"
end
