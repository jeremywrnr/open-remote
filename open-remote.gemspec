lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "or-version"

Gem::Specification.new do |g|
  g.name        = "open-remote"
  g.date        = "2016-01-10"
  g.version     = OpenRemote::VERSION
  g.platform    = Gem::Platform::RUBY
  g.summary     = "open a git repo's remote from a terminal."
  g.description = "open a git repo's remote host in your browser, from terminal."

  g.author      = "Jeremy Warner"
  g.email       = "jeremywrnr@gmail.com"
  g.homepage    = "http://github.com/jeremywrnr/open-remote"
  g.license     = "MIT"

  g.add_dependency "grit"
  g.add_dependency "colored", ">= 1.2"
  g.add_development_dependency "rspec", "~> 3.3", ">= 3.3.2"

  g.files       = ["lib/open-remote.rb"]
  g.require_path = 'lib'
  g.executables = ["open-remote"]
end

