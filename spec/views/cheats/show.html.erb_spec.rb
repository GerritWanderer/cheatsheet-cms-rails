require 'spec_helper'

describe "cheats/show.html.erb" do
  before(:each) do
    @cheat = assign(:cheat, stub_model(Cheat,
      :name => "Name",
      :preview => "Preview",
      :position => 1,
      :block => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Preview/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
