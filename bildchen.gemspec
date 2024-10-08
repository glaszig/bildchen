# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bildchen/version'

Gem::Specification.new do |spec|
  spec.name          = "bildchen"
  spec.version       = Bildchen::VERSION
  spec.authors       = ["glaszig"]
  spec.email         = ["glaszig@gmail.com"]
  spec.description   = %q{Find the most likely favicon for a given URL}
  spec.summary       = %q{Tries to find the most likely favicon for a given URL via HTTP HEAD requests and traversing up the URI path.}
  spec.homepage      = "https://www.github.com/glaszig/bildchen"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "webrick"
end
