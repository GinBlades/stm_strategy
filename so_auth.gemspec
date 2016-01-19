$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "so_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "so_auth"
  s.version     = SoAuth::VERSION
  s.authors     = ["Jeremy Green"]
  s.email       = ["jeremy@octolabs.com"]
  s.homepage    = "https://github.com/jagthedrummer/so_auth"
  s.summary     = "A gem that allows a Rails app to be an client of SoAuthProvider."
  s.description = "A gem that allows a Rails app to be an client of SoAuthProvider."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.2.5"
  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-oauth2', "~> 1.3.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'cucumber-rails'
  s.add_development_dependency 'database_cleaner'
end
