# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'mongoid/embedded_with/version'

Gem::Specification.new do |s|
  s.name        = 'mongoid-embedded_with'
  s.version     = Mongoid::EmbeddedWith::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Chris Massey', 'Kyle Crop']
  s.email       = ['chris@adelyte.com', '']
  s.homepage    = 'https://github.com/adelyte/mongoid-embedded_with'
  s.summary     = 'Mongoid embedded document relations.'
  s.description = 'Mongoid relations between embedded documents with the same root document.'

  s.rubyforge_project = 'mongoid-embedded_with'

  s.add_dependency 'mongoid', ['> 3.0']
  s.add_dependency 'stringex', '~> 1.4'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'awesome_print'

  s.files         = Dir.glob('lib/**/*') + %w(README.md)
  s.test_files    = Dir.glob('spec/**/*')
  s.require_paths = ['lib']
end
