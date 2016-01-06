# open-remotes parsing and opening

require "or-version"
require "or-browser"

class OpenRemote
  extend OpenRemote::Browser

  def initialize
    #@repo = grit
  end

  def run(args)
    arg = args.shift
    case arg
    when nil # open first remote
      Browser.browse remotes

    when "--help", "-h"
      puts OpenRemote::Help

    when "--version", "-v"
      puts OpenRemote::Version

    else # cross check against remotes
      Browser.browse remotes(arg)
    end
  end

  def remotes(search = /.*/)
    # todo get git remotes using grit
    remotes = ['https://github.com/jeremywrnr/booker.git']
    remote = remotes.find { |remote| search.match remote }

    raise "No remotes found that match #{search}" if remote.nil?

    remote
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

