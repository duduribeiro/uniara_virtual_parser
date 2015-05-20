require 'rspec'
require 'webmock/rspec'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require 'uniara_virtual_parser'
