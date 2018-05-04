
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shards-ui/version"

Gem::Specification.new do |spec|
  spec.name          = "shards-ui"
  spec.version       = Shards::Ui::VERSION
  spec.authors       = ["mkhairi"]
  spec.email         = ["khairi@labs.my"]

  spec.summary       = %q{Shards is a free and modern Bootstrap 4 (final) UI toolkit.}
  spec.description   = %q{A modern UI kit packed extra custom components built on top of Bootstrap 4 (final)}
  spec.homepage      = "https://github.com/mkhairi/shards-ui"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'sass', '>= 3.5.2'
  spec.add_runtime_dependency 'autoprefixer-rails', '>= 6.0.3'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
