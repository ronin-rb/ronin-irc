require 'spec_helper'
require 'ronin/irc/version'

describe IRC do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_nil
  end
end
