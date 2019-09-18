# unit testing for open-remote

require "spec_helper"

describe OpenRemote do
  def run(str)
    OpenRemote.new.run(str.split)
  end

  class OpenRemote
    def remotes(*s)
      [
        {:remote => 'origin', :url => 'https://github.com/user/repo.git'},
        {:remote => 'bucket', :url => 'git@bitbucket.org:<user>/repo.git'},
        {:remote => 'heroku', :url => 'https://git.heroku.com/app.git'},
      ]
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

  it "should not crash with valid args" do
    run "bitbucket"
    run "github"
    run "heroku"
  end

  it "should not crash with invalid args" do
    run "fake_input"
    run "test 123 *!"
  end

  it "should match valid repos" do
    remotes = OpenRemote.new.remotes
      .map {|r| r[:url] }
      .map {|r| OpenRemote::Browser.prepare r}
    expect(run "user/repo").to eq remotes[0]
    expect(run "origin").to eq remotes[0]
    expect(run "bucket").to eq remotes[1]
    expect(run "heroku").to eq remotes[2]
  end
end

