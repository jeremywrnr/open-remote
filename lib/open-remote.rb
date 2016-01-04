# open-remotes parsing and opening

require "or-version"

class OpenRemote
  def pexit(sys, msg)
    puts msg
    exit sys
  end

  # get user command
  def run(args)
    if args.empty?
      puts HELP_BANNER
    else
      puts args
    end
    true
  end
end


# large constant strings

HELP_BANNER = <<-EOS
open-remote - git remote opening tool.

`git open-remote` opens the first remote.

to open a specific remote, specify the host:

`git open-remote bit`,
`git open-remote bucket`,
`git open-remote bitbucket`,
  will all open bitbucket remote in the browser.

EOS

