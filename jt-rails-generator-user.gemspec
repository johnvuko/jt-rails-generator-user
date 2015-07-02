Gem::Specification.new do |s|
	s.name = 'jt-rails-generator-user'
	s.summary = "Generate a scaffold for user authentication in Ruby On Rails"
	s.description = "JTRailsGeneratorUser is a generator for user authentication. You have the login and sign up page, password forgot feature."
	s.homepage = 'https://github.com/jonathantribouharet/jt-rails-generator-user'
	s.version = '1.0.0'
	s.files = `git ls-files`.split("\n")
	s.require_paths = ['lib']
	s.authors = ['Jonathan TRIBOUHARET']
	s.email = 'jonathan.tribouharet@gmail.com'
	s.license = 'MIT'
	s.platform = Gem::Platform::RUBY
end
