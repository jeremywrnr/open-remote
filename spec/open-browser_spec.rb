# unit testing for open-browser

require "spec_helper"

describe OpenRemote::Browser do
  class OpenRemote # spoof OS, sys
    def Browser.open(x) puts x end

    def OS.mac?() true end
  end

  def run(str)
    OpenRemote::Browser.browse(str)
  end

  it "should have correct browser cmd" do
    expect(OpenRemote::Browser.browser).to eq "open "
  end

  # url: https://github.com/<user>/<repo>.git
  # out: https://github.com/<user>/<repo>
  it "should open https git remotes" do
    remote = "https://github.com/user/repo.git"
    website = "https://github.com/user/repo"
    expect(run remote).to eq website
  end

  # url: git@bitbucket.org:<user>/<repo>.git
  # out: https://bitbucket.org/<user>/<repo>
  it "should open ssh git remotes" do
    remote = "git@bitbucket.org:user/repo.git"
    website = "https://bitbucket.org/user/repo"
    expect(run remote).to eq website
  end

  # todo - get an example in/out
  it "should work on heroku remotes" do
    remote = "heroku"
    website = "break?"
    expect(run remote).to eq website
  end
end

