# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postino/version'

Gem::Specification.new do |spec|
  spec.name          = "postino"
  spec.version       = Postino::VERSION
  spec.authors       = ["Alessandro Desantis"]
  spec.email         = ["desa.alessandro@gmail.com"]
  spec.summary       = %q{A gem to generate Italian postal payment forms.}
  spec.description   = %q{Postino is a gem that allows to generate Italian postal payment forms in PDF format using Prawn.}
  spec.homepage      = "https://github.com/alessandro1997/postino"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "prawn", '< 0.14'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", '~> 10.1'
  spec.add_development_dependency "rspec", '~> 2.14'
  spec.add_development_dependency "fuubar", '~> 1.3'
end
