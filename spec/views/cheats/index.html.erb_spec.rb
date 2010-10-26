require 'spec_helper'

describe "cheats/index.html.erb" do
  before(:each) do
    @cheats = Cheat.make(2)
  end

  it "renders a list of cheats" do
    render
    assert_select "tr>td", :text => "Sample Cheat".to_s, :count => 2
    assert_select "tr>td", :text => "Lorem ipsum...".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end