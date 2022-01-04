# frozen_string_literal: true

require_relative 'lib/switchbot/version'

Gem::Specification.new do |spec|
  spec.name          = 'switchbot'
  spec.version       = Switchbot::VERSION
  spec.authors       = ['Yoshiki Takagi']
  spec.email         = ['yoshiki.tkg@gmail.com']

  spec.summary       = 'SwitchBot API client for Ruby'
  spec.description   = 'SwitchBot API client for Ruby'
  spec.homepage      = 'https://github.com/ytkg/switchbot'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/ytkg/switchbot'
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'activesupport'
  spec.add_dependency 'faraday', '~> 1.3.0'
  spec.add_dependency 'faraday_middleware'

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'rubocop', '>= 1.24.1'
  spec.add_development_dependency 'webmock'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
