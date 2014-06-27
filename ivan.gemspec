# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ivan/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'ivan'
  s.version     = Ivan::VERSION
  s.summary     = 'Quickly add basic tests.'
  s.description = 'Replaces and adds basic specs if annotations are present'
  s.license     = 'MIT'
  s.authors     = ['Alex Manelis']
  s.email       = ['amanelis@gmail.com']
  s.homepage    = 'https://github.com/amanelis/ivan'

  s.files = Dir['Rakefile', '{bin,lib,spec}/**/*', 'README*'] & `git ls-files`.split("\n")

  s.require_paths = ['lib']
  s.rubyforge_project = 'ivan'

  s.add_dependency 'activesupport'
  s.add_dependency 'rest-client'
  s.add_dependency 'annotate'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-core'
  s.add_development_dependency 'rspec-mocks'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec-expectations'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'coveralls'
end
