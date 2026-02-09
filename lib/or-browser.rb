# Detect operating system
#
module OpenRemote::OS
  def os_name
    if /darwin/.match?(RUBY_PLATFORM)
      "mac"
    elsif /cygwin|mswin|mingw|bccwin|wince|emx/.match?(RUBY_PLATFORM)
      "dos"
    else
      "nix"
    end
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
    open_url prepare remote
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
  def open_url(url)
    puts "Opening: ".green + url

    # Use spawn for better control - detach browser process and suppress its output
    # This allows the script to exit cleanly while hiding verbose GTK warnings
    begin
      pid = spawn("#{browser}#{url}", out: "/dev/null", err: "/dev/null")
      Process.detach(pid)
    rescue Errno::ENOENT
      puts "Error: Could not find browser command '#{browser.strip}'".red
      exit 1
    rescue => e
      puts "Error opening browser: #{e.message}".red
      exit 1
    end
  end

  # Parse remote to determine whether it is https/ssh, give link
  #
  def prepare(url)
    hb = "https://" # https base url
    if /^https/.match?(url) # is website, return w/o .git ending
      url.sub(/\.git$/, "")

    elsif /^git@/.match?(url) # git remote w/ @
      git_at_to_https hb, url

    elsif /^git:/.match?(url) # git remote w/ :
      git_colon_to_https hb, url

    elsif /^ssh/.match?(url) # is ssh link, change to website
      ssh_to_https hb, url

    else # unknown, return a generic link
      raise "Malformed remote url: " + url
    end
  end

  # Helper transformations
  #
  def git_at_to_https(base, url)
    info = url.partition("@").last
    host = info.partition(":").first
    user_repo = info.partition(":").last
    user_repo.sub!(/\.git$/, "")
    "#{base}#{host}/#{user_repo}"
  end

  def git_colon_to_https(base, url)
    info = url.partition("://").last
    info.sub!(/\.git$/, "")
    base << info
  end

  def ssh_to_https(base, url)
    info = url.partition("@").last
    info.sub!(/\.git$/, "")
    base << info
  end
end
