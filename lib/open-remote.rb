# open-remotes parsing and opening

require "or-version"

class OpenRemote
  def pexit(sys, msg)
    puts msg
    exit sys
  end

  # execute user command
  def run(args)
    arg = args.shift
    case arg
    when nil
    when "--help", "-h"
      puts OpenRemote::Help
    when "--version", "-v"
    else # cross check against remotes
    end

    true
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

