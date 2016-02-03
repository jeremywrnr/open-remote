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

    remote = remotes.find { |remote| remote.match search }

    if remote.nil?
      puts "No remotes found that match #{search.to_s.red}. All remotes:\n" +
        remotes.join("\n")
      exit 1
    else
      remote
    end
  end

  def remotes
    %x{git remote -v}.split("\n").map { |r| r.split[1] }.uniq
  end
end


# large constant strings

OpenRemote::Help = <<-HELP
open-remote - git remote opening tool.

`git open` opens the first listed remote.

to open a particular remote, specify the host:

`git open bit`,
`git open bucket`,
`git open bitbucket`,
  will all open bitbucket remote in the browser.

Tested against github, bitbucket, and heroku repos.

HELP

