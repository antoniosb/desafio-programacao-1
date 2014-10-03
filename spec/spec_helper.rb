ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
#require 'rspec/autorun'
require 'database_cleaner'
require 'capybara/rails'
require 'capybara/rspec'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.order = "random"
  config.include Capybara::DSL
  config.include Rails.application.routes.url_helpers
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:suite) do
    DatabaseCleaner.start
  end

  config.after(:suite) do
    DatabaseCleaner.clean
  end
end
