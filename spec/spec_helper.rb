require 'rspec'
require 'webmock/rspec'
require 'simplecov'
require 'support/fixture_helper'

SimpleCov.start do
  add_filter '/spec/'
end

RSpec.configure do |config|
  config.include FixtureHelper
end

require 'uniara_virtual_parser'
