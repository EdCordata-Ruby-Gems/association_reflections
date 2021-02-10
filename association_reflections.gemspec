# frozen_string_literal: true

$:.push ::File.expand_path('../lib', __FILE__)

require 'association_reflections/version'

::Gem::Specification.new do |s|
  s.name        = 'association_reflections'
  s.date        = '2020-10-24'
  s.email       = 'EdCordata@gmail.com'
  s.version     = ::AssociationReflections::VERSION
  s.summary     = 'This gem lets you access form parameters in your model.'
  s.authors     = ['EdCordata']
  s.license     = 'MIT'
  s.homepage    = 'https://github.com/EdCordata-Ruby-Gems/association_reflections'
  s.description = 'This gem lets you access form parameters in your model.'

  s.files         = ::Dir["{lib}/**/*", 'readme.md']
  s.require_paths = ['lib']

  s.add_development_dependency 'rails', ['>= 3.2']

end
