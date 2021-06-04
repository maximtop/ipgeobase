# frozen_string_literal: true

require_relative "lib/ipgeobase/version"

Gem::Specification.new do |spec|
  spec.name          = "Ipgeobase"
  spec.version       = Ipgeobase::VERSION
  spec.authors       = ["Topciu Maxim"]
  spec.email         = ["maximtop@gmail.com"]
  spec.summary       = "Retrieves ip data"
  spec.description   = "Retrieve ip data"
  spec.homepage      = "https://github.com/maximtop/ipgeobase"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/maximtop/ipgeobase"
  spec.metadata["changelog_uri"] = "https://github.com/maximtop/ipgeobase"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
