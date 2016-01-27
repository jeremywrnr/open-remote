require_relative "../lib/open-remote.rb"

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

# testing sys output
def puts(*x) x.join end

