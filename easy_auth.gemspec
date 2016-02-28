$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "easy_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "easy_auth"
  s.version     = EasyAuth::VERSION
  s.authors     = ["aquinofb"]
  s.email       = ["aquinofb@gmail.com"]
  s.homepage    = "https://github.com/aquinofb/easy_auth"
  s.summary     = "Authorizations."
  s.description = "Authorizations."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4"
end
