# frozen_string_literal: true

require_relative "lib/crumby/version"

Gem::Specification.new do |spec|
  spec.name          = "crumby"
  spec.version       = Crumby::VERSION
  spec.authors       = ["Ryan Duryea"]
  spec.email         = ["aguynamedryan@gmail.com"]

  spec.summary       = "Takes a URL and passes it to YaCy server to avoid CORS issues"
  spec.description   = "Takes a URL and passes it to YaCy server to avoid CORS issues"
  spec.homepage      = "https://github.com/aguynamedryan/crumby"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/aguynamedryan/crumby"
  spec.metadata["changelog_uri"] = "https://github.com/aguynamedryan/crumby/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
