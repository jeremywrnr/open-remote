# unit testing for open-browser

require "spec_helper"

describe OpenRemote::Browser do
  module OpenRemote::OS # spoof OS
    def os_name() "nix" end
  end

  def run(str)
    OpenRemote::Browser.prepare(str)
  end

  it "should have correct browser cmd" do
    expect(OpenRemote::Browser.browser).to eq "xdg-open "
  end

  # url: https://git.heroku.com/codepilot.git
  # out: https://dashboard.heroku.com/apps/<app>
  it "should open heroku remotes" do
    remote = "https://git.heroku.com/app.git"
    website = "https://dashboard.heroku.com/apps/app"
    expect(run remote).to eq website
  end

  # url: https://github.com/<user>/<repo>.git
  # out: https://github.com/<user>/<repo>
  it "should open https remotes" do
    remote = "https://github.com/user/repo.git"
    website = "https://github.com/user/repo"
    expect(run remote).to eq website
  end

  # url: git@bitbucket.org:<user>/<repo>.git
  # out: https://bitbucket.org/<user>/<repo>
  it "should open git@ remotes" do
    remote = "git@bitbucket.org:user/repo.git"
    website = "https://bitbucket.org/user/repo"
    expect(run remote).to eq website
  end

  # url: git://github.com/user/repo.git
  # out: https://github.com/user/repo
  it "should open git: remotes" do
    remote = "git://github.com/user/repo.git"
    website = "https://github.com/user/repo"
    expect(run remote).to eq website
  end

  # url: ssh://git@bitbucket.org:<user>/<repo>.git
  # out: https://bitbucket.org/<user>/<repo>
  it "should open ssh remotes" do
    remote = "ssh://git@bitbucket.org/user/repo.git"
    website = "https://bitbucket.org/user/repo"
    expect(run remote).to eq website
  end
end

