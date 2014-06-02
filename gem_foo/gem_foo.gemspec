# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gem_foo/version'

Gem::Specification.new do |spec|
  spec.name          = "gem_foo"
  spec.version       = GemFoo::VERSION
  spec.authors       = ["ilake"]
  spec.email         = ["lake.ilakela+github@gmail.com"]
  spec.summary       = "gem foo summary"
  spec.description   = "gem foo description"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
