$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "easy_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "EasyAuth"
  s.version     = EasyAuth::VERSION
  s.authors     = ["aquinofb"]
  s.email       = ["aquinofb@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of EasyAuth."
  s.description = "TODO: Description of EasyAuth."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4"

  s.add_development_dependency "sqlite3"
end
