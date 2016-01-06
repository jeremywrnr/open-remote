# open-remotes parsing and opening

require "or-version"
require "or-browser"

class OpenRemote
  def run(args)
    arg = args.shift
    case arg
    when nil # open first listed remote
      # todo
    when "--help", "-h"
      puts OpenRemote::Help
    when "--version", "-v"
      puts OpenRemote::Version
    else # cross check against remotes
      # todo
    end
  end

  def remotes
    # todo
  end

  def opener
    # todo - extend browser functionality
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

EOS

