# Detect operating system
#
module OpenRemote::OS
  def os_name
    if mac?
      "mac"
    elsif dos?
      "dos"
    elsif nix?
      "nix"
    else
      raise "Unknown operating system."
    end
  end

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
    open prepare remote
  end

  # Return the right command for opening a website from the terminal
  #
  def browser
    case os_name
    when "mac"
      "open "
    when "dos"
      "start "
    when "nix"
      "xdg-open "
    end
  end

  # Make the system call to open up a website
  #
  def open(url)
    system browser, url
  end

  # Parse remote to determine whether it is https/ssh, give link
  #
  def prepare(url)
    hb = "https://" # https base url
    if /^https/.match(url) # is website, return w/o .git ending
      url.sub(/\.git$/, "")

    elsif /^git.*heroku/.match(url) # is heroku, change to app

    elsif /^git/.match(url) # is ssh link, change to website
      ssh_to_https hb, url

    else # unknown, return a generic link
      hb + url
    end
  end

  # url: git@host:user/repo.git
  # out: https://host/user/repo
  def ssh_to_https(base, url)
    info = url.partition("@").last
    host = info.partition(":").first
    user_repo = info.partition(":").last
    user_repo.sub!(/\.git$/, "")
    "#{base}#{host}/#{user_repo}"
  end
end

