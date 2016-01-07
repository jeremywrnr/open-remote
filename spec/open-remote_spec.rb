# unit testing for open-remote

require "spec_helper"

describe OpenRemote do
  def run(str)
    OpenRemote.new.run(str.split)
  end

  class OpenRemote
    def remotes(*s)
      %w{https://github.com/user/repo.git
          git@bitbucket.org:<user>/repo.git
          https://git.heroku.com/app.git}
    end

    def Browser::open(url)
      puts url
    end
  end

  it "should show OpenRemote help" do
    help = OpenRemote::Help
    expect(run "--help").to eq help
    expect(run "-h").to eq help
  end

  it "should show OpenRemote version" do
    vers = OpenRemote::Version
    expect(run "--version").to eq vers
    expect(run "-v").to eq vers
  end

  it "should not crash with no args" do
    run ""
  end

  it "should not crash with args" do
    run "bitbucket"
    run "github"
    run "heroku"
  end
end

