task :default  => :spec

# Load open-remote files straight into ruby path
lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

# gem name, version
g = "open-remote"
require "open-remote"
v = OpenRemote::Version


# Testing
#
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec) do |rake|
  rake.rspec_opts = "--color --format documentation"
  rake.verbose = true
end

task :dev do
  sh 'filewatcher "**/*.rb" "clear && rake"'
end


# Gem management
#
task :build do
	sh "gem build #{g}.gemspec"
	sh "gem install ./#{g}-#{v}.gem"
end

task :clean do
	sh "rm -fv *.gem"
end

task :push => [:clean, :build] do
	sh "gem push #{g}-#{v}.gem"
end


# Documentation
#
task :man do
  require 'tempfile'

  markdown = File.read("README.md")
  markdown.gsub!(/^!\[(.+)\]\(.*\)/, '    \1')

  Tempfile.open('README') do |f|
    f.write(markdown)
    f.flush
    sh "ronn --pipe --roff #{f.path} > man/open-remote.1"
  end
end

task :html do
  sh "rm -rf html"
  sh "mkdir html"
  sh "ronn --pipe --html --style=toc README.md > html/index.html"
end

