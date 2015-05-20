# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uniara_virtual_parser/version'

Gem::Specification.new do |spec|
  spec.name          = 'uniara_virtual_parser'
  spec.version       = UniaraVirtualParser::VERSION
  spec.authors       = ['Carlos Ribeiro']
  spec.email         = ['mail@carlosribeiro.me']
  spec.summary       = 'A Gem to parse the Uniara Virtual system'
  spec.description   = spec.summary
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2.0'
end
