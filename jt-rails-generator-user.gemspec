Gem::Specification.new do |s|
	s.name = 'jt-rails-generator-user'
	s.summary = "Generate a scaffold for user authentication in Ruby On Rails"
	s.description = "JTRailsGeneratorUser is a generator for user authentication. You have the login and sign up page, password forgot feature."
	s.homepage = 'https://github.com/jonathantribouharet/jt-rails-generator-user'
	s.version = '1.0.4'
	s.files = `git ls-files`.split("\n")
	s.require_paths = ['lib']
	s.authors = ['Jonathan TRIBOUHARET']
	s.email = 'jonathan.tribouharet@gmail.com'
	s.license = 'MIT'
	s.platform = Gem::Platform::RUBY

	s.add_dependency('validates_email_format_of', '~> 1.6')
	s.add_dependency('bcrypt', '~> 3.1.7')
	s.add_dependency('jt-rails-tokenizable', '~> 1.0')
end
