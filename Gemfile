source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

require_relative 'config/initializers/file_exists'
gem 'bcrypt', '~> 3.1'
gem 'decanter', '~> 4.0'
gem 'factory_bot_rails', '~> 6.4'
gem 'faker', '~> 3.3'
gem 'figaro', '~> 1.2'
gem 'jsonapi-serializer', '~> 2.2'
gem 'lp_token_auth', '~> 2.0'
gem 'paper_trail', '~> 15.1'
gem 'rack-cors', '~> 2.0'
gem 'rails', '~> 7.1.3'
gem 'rails_util', github: 'launchpadlab/rails_util'
gem 'redis'
gem 'rubocop'
gem 'rubocop-performance'
gem 'sentry-rails', '~> 5.17'
gem 'sentry-ruby', '~> 5.17'
gem 'sentry-sidekiq', '~> 5.17'
gem 'sidekiq', '~> 7.2'
gem 'token_master', '~> 1.0'

gem 'pg', '~> 1.1'

gem 'puma', '~> 6.4.2'

gem 'cssbundling-rails'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

group :development, :test do
  gem 'pry', '~> 0.14.2'
  gem 'rspec-rails', '~> 6.0.0'

  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet', '~> 7.1'
  gem 'letter_opener'
  gem 'overcommit'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'database_cleaner-redis'
  gem 'rspec-collection_matchers'
  gem 'shoulda-matchers', '~> 6.2'
end
