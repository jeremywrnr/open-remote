# unit testing for open-remote

require "spec_helper"

describe OpenRemote do
  def run(str)
    OpenRemote.new.run(str.split)
  end

  before "create fake remotes" do
    # todo
  end

  it "should pass a basic rspec test" do
    expect(run "hi").to eq true
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
end

