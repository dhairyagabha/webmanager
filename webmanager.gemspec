$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "webmanager/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "webmanager"
  s.version     = Webmanager::VERSION
  s.authors     = ["Dhairya Gabhawala"]
  s.email       = ["gabhawaladhairya@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Webmanager."
  s.description = "Description of Webmanager."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.1"
  s.add_dependency "devise"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "paperclip", "~> 5.0.0"
  s.add_dependency "aws-sdk", "~> 2.3"
  s.add_dependency "trix"
  s.add_development_dependency "pg"
end
