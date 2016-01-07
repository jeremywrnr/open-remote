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

  def remote(search = /.*/)
    remote = remotes.find { |remote| remote.match search }

    raise "No remotes found that match #{search}. All remotes:\n".green +
      remotes.join("\n") if remote.nil?

    remote
  end

  def remotes
    %x{git remote -v}.split("\n").map { |r| r.split[1] }
  end
end


# large constant strings

OpenRemote::Help = <<-HELP
open-remote - git remote opening tool.

`git open-remote` opens the first remote.

to open a specific remote, specify the host:

`git open-remote bit`,
`git open-remote bucket`,
`git open-remote bitbucket`,
  will all open bitbucket remote in the browser.

Tested against github, bitbucket, and heroku repos.

HELP

