# open-remotes parsing and opening

require "colored"
require "or-version"
require "or-browser"

class OpenRemote
  extend OpenRemote::Browser

  def run(args)
    arg = args.shift

    case arg
    when nil # open first remote
      Browser.browse remote

    when "--help", "-h"
      puts OpenRemote::Help

    when "--version", "-v"
      puts OpenRemote::Version

    when "--alias"
      system "git config --global alias.open '!open-remote'"

    when "--unalias"
      system "git config --global --unset alias.open"

    when "--output", "-o"
      puts Browser.prepare remote

    else # check against remotes
      Browser.browse remote(arg)
    end
  end

  def no_repo?
    `git status 2>&1`.split("\n").first ==
      "fatal: Not a git repository (or any of the parent directories): .git"
  end

  def remote(search = /.*/)
    if no_repo?
      puts "Not currently in a git repository.".red
      exit 1
    end

    remote_site = remotes.find { |r| r.each_value.any? { |d| d.downcase.match search } }

    if remote_site.nil?
      puts "No remotes found that match #{search.to_s.red}. All remotes:\n" +
        remotes.join("\n")
      exit 1
    else
      remote_site[:url]
    end
  end

  def remotes
    %x{git remote -v}.split("\n").map {|r| {
      :remote => r.split[0],
      :url => r.split[1],
    }}.uniq
  end
end


# large constant strings

OpenRemote::Help = <<-HELP
A tool for git remote opening tool. Open the remote url:

    git open

Options:

    -h, --help    show help
    -v, --version show open-remote version
    -o, --output  show output without opening
    --alias       add open-remote to git alias
    --unalias     remove open-remote from git

To open a particular remote, specify the host:

    git open bit
    git open bucket
    git open bitbucket

These all open bitbucket's remote url in the browser.
Tested against github, bitbucket, and heroku repos.
HELP

