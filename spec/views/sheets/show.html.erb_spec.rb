require 'spec_helper'

describe "sheets/show.html.erb" do
  before(:each) do
    @sheet = Sheet.make
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Sample Cheatsheet/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Lorem ipsum.../)
  end
end
