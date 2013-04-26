# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'replay/version'

Gem::Specification.new do |spec|
  spec.name          = "replay"
  spec.version       = Replay::VERSION
  spec.authors       = ["Brian Smith"]
  spec.email         = ["brianthecoder@gmail.com"]
  spec.description   = %q{Replay errors from airbrake on you local machine}
  spec.summary       = %q{Replay errors from airbrake on you local machine}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "airbrake"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "tilt"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
