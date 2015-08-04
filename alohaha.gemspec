# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "alohaha/settings"

Gem::Specification.new do |spec|
  spec.name          = "Alohaha"
  spec.version       = Settings::VERSION
  spec.authors       = ["jiunjiun"]
  spec.email         = ["quietmes@gmail.com"]
  spec.summary       = %q{Alohaha}
  spec.description   = %q{This API helper get Taoyuan airport flight info}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency('curb')
  spec.add_dependency('iconv')
  spec.add_dependency('virtus')
end
