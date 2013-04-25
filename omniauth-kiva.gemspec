# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-kiva/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-kiva"
  gem.version       = OmniAuth::Kiva::VERSION
  gem.authors       = ["Amit Pansare", "Paul Ericksen"]
  gem.email         = ["amit@kiva.org, paul@kiva.org"]
  gem.description   = %q{Kiva's OAuth 1.0a strategy for OmniAuth 1.0}
  gem.summary       = %q{Kiva's OAuth 1.0a strategy for OmniAuth 1.0}
  gem.homepage      = "https://github.com/kiva/omniauth-kiva"
  gem.license       = "MIT"

  gem.add_runtime_dependency     'omniauth-oauth', '~> 1.0'
  gem.add_runtime_dependency     'kiva'
  gem.add_development_dependency 'rspec', '~> 2.6'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'rake'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
