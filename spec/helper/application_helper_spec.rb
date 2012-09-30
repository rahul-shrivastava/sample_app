require 'spec_helper'

describe ApplicationHelper do

  it "should return a string for no input" do
     full_title('').should == "Ruby on Rails Tutorial Sample App"
  end
  it "should return contacted string " do
    full_title('About Us').should =~ /About/
  end
end