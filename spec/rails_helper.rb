ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'factory_bot'

require 'spec_helper'
require 'vcr_helper'
require 'webmock_helper'

ActiveRecord::Migration.maintain_test_schema!

module JsonHelpers
  def response_json
    @response_json ||= JSON.parse(response.body, symbolize_names: true)
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.infer_spec_type_from_file_location!

  config.include JsonHelpers, type: :controller
  config.before(:example, type: :controller) do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end
  config.include WebmockHelpers
  config.include Devise::Test::ControllerHelpers, type: :controller

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation, except: [ActiveRecord::InternalMetadata.table_name])
  end

  config.before(:each) do
    DatabaseCleaner.start
    Timecop.freeze
  end

  config.after(:each) do
    DatabaseCleaner.clean
    Timecop.return
  end

  config.around(:each, disable_transactions: true) do |example|
    DatabaseCleaner.strategy = :truncation
    example.run
    DatabaseCleaner.strategy = :transaction
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
