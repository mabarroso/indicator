$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "indicator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "indicator"
  s.version     = Indicator::VERSION
  s.authors     = ["Miguel Adolfo Barroso"]
  s.email       = ["mabarroso@mabarroso.com"]
  s.homepage    = "http://github.com/mabarroso/indicator"
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Display activity with ASCII spinners and progress indicators."
  s.description = "Sometimes you need to display activity on the text console to inform the user that the program is actually doing something. Be funny with a lot predefined sets or make you own widget to display an animation text during a long-running process in your console app."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "rspec", "~> 2.7.0"
end
