# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stellar_client/version'

Gem::Specification.new do |spec|
  spec.name          = "stellar_client"
  spec.version       = StellarClient::VERSION
  spec.authors       = ["Ramon Tayag"]
  spec.email         = ["ramon.tayag@gmail.com"]

  spec.summary       = %q{Ruby wrapper for Stellar's Stellar Server API}
  spec.description   = %q{Ruby wrapper for Stellar's Stellar Server API}
  spec.homepage      = "https://github.com/imacchiato/stellar_client-ruby"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "gem_config", "~> 0.3.1"
  spec.add_dependency "typhoeus", "~> 1.1"
  spec.add_dependency "virtus", "~> 1.0"
  spec.add_dependency "api_client_base", "~> 1.0"
  spec.add_dependency "activesupport", ">= 3.0.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "virtus-matchers"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock"
end
