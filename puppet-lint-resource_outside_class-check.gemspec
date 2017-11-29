Gem::Specification.new do |spec|
   spec.name        = 'puppet-lint-resource_outside_class-check'
   spec.version     = '0.0.1'
   spec.homepage    = 'https://github.com/llowder/puppet-lint-resource_outside_class-check'
   spec.license     = 'MIT'
   spec.author      = 'Lee Lowder'
   spec.email       = 'friedbob@keepingyouhonest.net'
   spec.files       = Dir[
     'README.md',
     'LICENSE',
     'lib/**/*',
     'spec/**/*',
   ]

   spec.test_files  = Dir['spec/**/*']
   spec.summary     = 'A puppet-lint plugin to check for resources outside of a class or defiend type definition.'
   spec.description = <<-EOF
     A puppet-lint plugin to check that manifest files do not contain resources outside of a class or defined type definition.
   EOF

   spec.add_dependency             'puppet-lint', '>= 1.0', '< 3.0'
   spec.add_development_dependency 'rspec', '~> 3.0'
   spec.add_development_dependency 'rspec-its', '~> 1.0'
   spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
   spec.add_development_dependency 'rake'
 end
