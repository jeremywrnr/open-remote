lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "or-version"

Gem::Specification.new do |g|
  g.author      = "Jeremy Warner"
  g.email       = "jeremywrnr@gmail.com"

  g.name        = "open-remote"
  g.version     = OpenRemote::Version
  g.platform    = Gem::Platform::RUBY
  g.date        = Time.now.strftime("%Y-%m-%d")
  g.summary     = "open a git repo's remote from your terminal."
  g.description = "open a git repo's web remote from your terminal."
  g.homepage    = "http://github.com/jeremywrnr/open-remote"
  g.license     = "MIT"

  g.add_dependency "grit"
  g.add_dependency "colored", ">= 1.2"
  g.add_development_dependency "ronn"
  g.add_development_dependency "rspec", "~> 3.3", ">= 3.3.2"

  g.files        = Dir.glob("{bin,lib,man}/**/*") + %w(readme.md)
  g.executables  = Dir.glob("bin/*").map(&File.method(:basename))
  g.require_path = 'lib'
end

