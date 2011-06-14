$:.push File.expand_path("../lib", __FILE__)
require "capsum"

Gem::Specification.new do |s|
  s.name        = "capsum"
  s.version     = Capsum::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["hansay99"]
  s.email       = ["hansay99@gmail.com"]
  s.homepage    = "http://github.com/sunteya/capsum"
  s.summary     = %q{Collect gems and recipes related capistrano.}
  s.description = %q{Collect gems and recipes related capistrano.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  
  # Dependency Gems
  s.add_dependency "capistrano", "~> 2.6.0"
  s.add_dependency "capistrano_colors", "~> 0.5.4"
  s.add_dependency "capistrano-ext", "~> 1.2.1"
  s.add_dependency "capistrano-helpers", "~> 0.6.5"
  # s.add_dependency "cap-recipes", "~> 0.3.36"
  # http://github.com/rubaidh/rubaidhstrano
  # https://github.com/relevance/cap_gun
  # https://github.com/railsmachine/capistrano-cowboy
  # https://github.com/fnichol/capstrap
  # https://github.com/bokmann/dunce-cap
  
  s.add_development_dependency "bundler"
  s.add_development_dependency "version"
end

