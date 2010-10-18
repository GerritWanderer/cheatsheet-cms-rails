require 'spec_helper'

describe Sheet do

  before(:each) do
    @attr = { :name => "Example Cheatsheet", :description => "Lorem Ipsum" }
  end

  it "should create a new instance given valid attributes" do
    Sheet.create!(@attr)
  end

  it "should require a name" do
    no_name_user = Sheet.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  it "should reject names that are too short" do
      long_name = "a" * 2
      long_name_user = Sheet.new(@attr.merge(:name => long_name))
      long_name_user.should_not be_valid
  end
  it "should reject names that are too long" do
      long_name = "a" * 255
      long_name_user = Sheet.new(@attr.merge(:name => long_name))
      long_name_user.should_not be_valid
  end

end
