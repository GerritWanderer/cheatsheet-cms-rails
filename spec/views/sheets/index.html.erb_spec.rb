require 'spec_helper'

describe "sheets/index.html.erb" do
  before(:each) do
    @sheets = Sheet.make(2)
  end

  it "renders a list of sheets" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "h3", :text => "Sample Cheatsheet".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "p", :text => "Lorem ipsum...".to_s, :count => 2
  end
end
