# Detect operating system
#
module OpenRemote::OS
  def mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def dos?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def nix?
    not (dos? || mac?)
  end
end


# Web browser opening commands
#
module OpenRemote::Browser end
class << OpenRemote::Browser
  include OpenRemote::OS

  # Generate and open approprate website from ssh/git link
  #
  def browse(remote)
    # todo
  end

  # Return the right command for opening a website from the terminal
  #
  def browser
    if mac?
      "open "
    elsif dos?
      "start "
    elsif nix?
      "xdg-open "
    end
  end

  # Parse a site to determine whether a given remote is https/ssh
  #
  def prepare(url)
    if /^http/.match(url) # already is a website, return
      url
    else # replace git links with ssh parts to web interface
      # todo
      "http://" + url
    end
  end
end

