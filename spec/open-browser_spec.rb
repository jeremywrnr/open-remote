# unit testing for open-browser

require "spec_helper"

describe OpenRemote::Browser do
  module OpenRemote::OS # spoof OS # standard:disable Lint/ConstantDefinitionInBlock
    def os_name
      "nix"
    end
  end

  def run(str)
    OpenRemote::Browser.prepare(str)
  end

  it "should have correct browser cmd" do
    expect(OpenRemote::Browser.browser).to eq "xdg-open "
  end

  # url: https://bitbucket.org/<user>/<repo.com>
  # out: https://bitbucket.org/<user>/<repo.com>
  it "should open repos with website names" do
    remote = "https://github.com/berkeleyhci/hci.berkeley.edu"
    website = "https://github.com/berkeleyhci/hci.berkeley.edu"
    expect(run(remote)).to eq website
  end

  # url: https://gitea.example.com/user/repo.git
  # out: https://gitea.example.com/user/repo
  it "should open gitea https remotes" do
    remote = "https://gitea.example.com/user/repo.git"
    website = "https://gitea.example.com/user/repo"
    expect(run(remote)).to eq website
  end

  # url: git@gitea.example.com:user/repo.git
  # out: https://gitea.example.com/user/repo
  it "should open gitea ssh remotes" do
    remote = "git@gitea.example.com:user/repo.git"
    website = "https://gitea.example.com/user/repo"
    expect(run(remote)).to eq website
  end

  # url: https://github.com/<user>/<repo>.git
  # out: https://github.com/<user>/<repo>
  it "should open https remotes" do
    remote = "https://github.com/user/repo.git"
    website = "https://github.com/user/repo"
    expect(run(remote)).to eq website
  end

  # url: git@bitbucket.org:<user>/<repo>.git
  # out: https://bitbucket.org/<user>/<repo>
  it "should open git@ remotes" do
    remote = "git@bitbucket.org:user/repo.git"
    website = "https://bitbucket.org/user/repo"
    expect(run(remote)).to eq website
  end

  # url: git://github.com/user/repo.git
  # out: https://github.com/user/repo
  it "should open git: remotes" do
    remote = "git://github.com/user/repo.git"
    website = "https://github.com/user/repo"
    expect(run(remote)).to eq website
  end

  # url: ssh://git@bitbucket.org:<user>/<repo>.git
  # out: https://bitbucket.org/<user>/<repo>
  it "should open ssh remotes" do
    remote = "ssh://git@bitbucket.org/user/repo.git"
    website = "https://bitbucket.org/user/repo"
    expect(run(remote)).to eq website
  end

  # url: ssb://%<msgid>.sha256
  # out: ssb://%<msgid>.sha256
  it "should hand ssb remotes to the ssb client" do
    remote = "ssb://%3HY71B7em4rZwMwz76yHIJZA1zo5BMBLd7Msh8LRFHI=.sha256"
    expect(run(remote)).to eq remote
  end

  # url: git-ssb://%<msgid>.sha256
  # out: ssb://%<msgid>.sha256
  it "should normalize git-ssb remotes to ssb" do
    remote = "git-ssb://%3HY71B7em4rZwMwz76yHIJZA1zo5BMBLd7Msh8LRFHI=.sha256"
    uri = "ssb://%3HY71B7em4rZwMwz76yHIJZA1zo5BMBLd7Msh8LRFHI=.sha256"
    expect(run(remote)).to eq uri
  end

  # ssb ids are base64 - the +/= must survive untouched
  it "should preserve base64 ssb message ids" do
    remote = "ssb://%a+b/c0Z9zK1QwErTyUiOpAsDfGhJkLzXcVbNmQwErTy=.sha256"
    expect(run(remote)).to eq remote
  end
end
