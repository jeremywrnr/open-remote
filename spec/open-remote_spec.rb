# unit testing for open-remote

require "spec_helper"

describe OpenRemote do
  def run(str)
    OpenRemote.new.run(str.split)
  end

  before "create fake remotes" do
    # todo
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
    run "bit even more"
    run "test"
  end

  it "should not crash with args" do
    run ""
  end
end

