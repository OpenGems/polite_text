require_relative 'lib/polite_text/version'

Gem::Specification.new do |spec|
  spec.name          = 'polite_text'
  spec.version       = PoliteText::VERSION
  spec.authors       = ['DumasOlivier']
  spec.email         = ['dumas.olivier@outlook.fr']

  spec.summary       = 'Remove swear words from users\' inputs.'
  spec.description   = 'Remove swear words from users\' inputs and replace them by asterisks (*)'
  spec.homepage      = 'https://github.com/DumasOlivier/polite'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # development dependencies
    #spec.add_development_dependency 'coveralls', '~> 0.8'
    #spec.add_development_dependency 'rspec-rails', '~> 4.0.0'
    #spec.add_development_dependency 'simplecov', '~> 0.16'
end
