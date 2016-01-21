$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stm_strategy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stm_strategy"
  s.version     = StmStrategy::VERSION
  s.authors     = ["Jeremy Green", "Shaun Martin"]
  s.email       = ["jeremy@octolabs.com", "webmaster@ginblades.com"]
  s.homepage    = "https://github.com/ginblades/stm_strategy"
  s.summary     = "Fork of Jeremy Green's gem that allows a Rails app to be an client of StmStrategyProvider."
  s.description = "Fork of Jeremy Green's gem that allows a Rails app to be an client of StmStrategyProvider."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.2.5"
  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-oauth2'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'cucumber-rails'
  s.add_development_dependency 'database_cleaner'
end
