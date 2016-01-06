# open-remotes parsing and opening

require "or-version"
require "or-browser"

class OpenRemote
  include OpenRemote::Browser

  def run(args)
    arg = args.shift
    case arg
    when nil # open first remote
      browse remotes.first

    when "--help", "-h"
      puts OpenRemote::Help

    when "--version", "-v"
      puts OpenRemote::Version

    else # cross check against remotes
      browse remotes(arg).first
    end
  end

  # todo get git remotes using grit
  def remotes(search = "*")
    remotes = []
    remotes.select { |remote| search.match remote }
  end
end


# large constant strings

OpenRemote::Help = <<-EOS
open-remote - git remote opening tool.

`git open-remote` opens the first remote.

to open a specific remote, specify the host:

`git open-remote bit`,
`git open-remote bucket`,
`git open-remote bitbucket`,
  will all open bitbucket remote in the browser.

Tested against github, bitbucket, and heroku repos.

EOS

