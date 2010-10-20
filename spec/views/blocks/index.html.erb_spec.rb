require 'spec_helper'

describe "blocks/index.html.erb" do
  before(:each) do
    @blocks = Block.make(2)
  end

  it "renders a list of blocks" do
    render
    assert_select "tr>td", :text => "Sample Block".to_s, :count => 2
    assert_select "tr>td", :text => "left".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    #assert_select "tr>td", :text => "Test Cheatsheet".to_s, :count => 2
  end
end
