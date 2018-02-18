
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "molt/version"

Gem::Specification.new do |spec|
  spec.name          = "molt"
  spec.version       = Molt::VERSION
  spec.authors       = ["Marco Cabazal"]
  spec.email         = ["marco.cabazal@chillmill.mobi"]

  spec.summary       = "VIPER module generator for Swift projects."
  spec.homepage      = "https://github.com/MarcoCabazal/Molt"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.required_ruby_version = ">= 2.2"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|sample_output)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["molt"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "liquid", "~> 4.0.0"
  spec.add_runtime_dependency 'terminal-table'
  spec.add_runtime_dependency "thor", "~> 0.20"

  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.4"
end
