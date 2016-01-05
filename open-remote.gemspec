lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "or-version"

Gem::Specification.new do |g|
  g.name        = "open-remote"
  g.version     = OpenRemote::VERSION
  g.platform    = Gem::Platform::RUBY
  g.date        = Time.now.strftime("%Y-%m-%d")
  g.summary     = "open a git repo's remote from a terminal."
  g.description = "open a git repo's remote host in your browser, from terminal."
  g.license     = "MIT"

  g.author      = "Jeremy Warner"
  g.email       = "jeremywrnr@gmail.com"
  g.homepage    = "http://github.com/jeremywrnr/open-remote"

  g.add_dependency "grit"
  g.add_dependency "colored", ">= 1.2"
  g.add_development_dependency "rspec", "~> 3.3", ">= 3.3.2"

  g.require_path = "lib"
  g.files       = ["lib/open-remote.rb", "lib/or-version.rb"]
  g.executables = ["open-remote"]
end

