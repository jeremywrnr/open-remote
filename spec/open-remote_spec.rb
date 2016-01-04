# unit testing for open-remote

require "spec_helper"

describe OpenRemote do
  def run(str)
    OpenRemote.new.run(str.split)
  end

  it "should pass a basic rspec test" do
    expect(run "hi").to eq true
  end
end

