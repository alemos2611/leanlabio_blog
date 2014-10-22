$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blogr/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blogr"
  s.version     = Blogr::VERSION
  s.authors     = ["Gareth Fuller"]
  s.email       = ["gareth.a.f@gmail.com"]
  s.homepage    = "https://github.com/GAFuller/blogr"
  s.summary     = "Blogging engine for existing rails apps."
  s.description = "A mountable rails engine that can be used to attach a blog to any existing rails app."
  s.license     = "Leanlab LTD"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency 'bcrypt', '~> 3.1.7'
  s.add_dependency "jquery-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "bootstrap-sass", "~> 3.2.0"
  s.add_dependency 'fog'
  s.add_dependency "mini_magick"
  s.add_dependency 'carrierwave'
  s.add_dependency 'medium-editor-rails'
  s.add_dependency 'gibbon'


  s.add_development_dependency "pg"
end
