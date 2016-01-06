# unit testing for open-browser

require "spec_helper"

describe OpenRemote::Browser do
  class OpenRemote # spoof OS
    def OS.mac?() true end
  end

  def run(str)
    OpenRemote::Browser.browse(str)
  end

  it "should have correct browser cmd" do
    @browser = "open " # for macs, this opens web links
    expect(OpenRemote::Browser.browser).to eq @browser
  end

  it "should open https git remotes" do
    raise # todo
  end

  it "should open ssh git remotes" do
    raise # todo
  end
end

