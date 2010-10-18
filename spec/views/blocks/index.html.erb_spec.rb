require 'spec_helper'

describe "blocks/index.html.erb" do
  before(:each) do
    assign(:blocks, [
      stub_model(Block,
        :name => "Name",
        :column => "Column",
        :position => 1,
        :sheet => stub_model(Sheet, :name => "Test Cheatsheet")
      ),
      stub_model(Block,
        :name => "Name",
        :column => "Column",
        :position => 1,
        :sheet => stub_model(Sheet, :name => "Test Cheatsheet")
      )
    ])
  end

  it "renders a list of blocks" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Column".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Test Cheatsheet".to_s, :count => 2
  end
end
