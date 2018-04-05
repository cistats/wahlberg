source 'https://rubygems.org'

# Rails
gem 'rails', '~> 5.1.2'

# Database
gem 'pg'

# App Server
gem 'puma', '~> 3.7'

# Ruby Env
gem 'dotenv-rails'
gem 'warning'
gem 'lograge'

group :development, :test do
  gem 'rspec', '~> 3.6'
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'awesome_print'
end

group :test do
  gem 'database_cleaner'
  gem 'webmock'
  gem 'vcr'
  gem 'timecop'
end

# Auth
gem 'devise'
gem 'omniauth-github'

# Responses
gem 'active_model_serializers'

# Github
gem 'octokit'
