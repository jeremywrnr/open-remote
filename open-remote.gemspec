lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "or-version"

Gem::Specification.new do |g|
  g.author = "Jeremy Warner"
  g.email = "jwrnr@berkeley.edu"

  g.name = "open-remote"
  g.version = OpenRemote::VERSION
  g.platform = Gem::Platform::RUBY
  g.summary = "open a git repo's remote from your terminal (git open)."
  g.description = "open a git repo's web remote from your terminal, with 'git open'."
  g.homepage = "http://github.com/jeremywrnr/open-remote"
  g.license = "MIT"

  g.add_dependency "colored", "~> 1.2"
  g.add_development_dependency "rake", "~> 13.0"
  g.add_development_dependency "rspec", "~> 3.0"
  g.add_development_dependency "standard", "~> 1.0"

  g.files = Dir.glob("{bin,lib}/**/*") + %w[readme.md]
  g.executables = Dir.glob("bin/*").map(&File.method(:basename))
  g.require_path = "lib"
end
