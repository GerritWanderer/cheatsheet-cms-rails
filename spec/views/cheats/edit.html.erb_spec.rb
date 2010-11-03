require 'spec_helper'

describe "cheats/edit.html.erb" do
  before(:each) do
    @cheat = Cheat.make
    @categories = Category.make(2)
  end

  it "renders the edit cheat form" do
    render
    assert_select "form", :action => cheat_path(@cheat), :method => "post" do
      assert_select "input#cheat_name[value='Sample Cheat']", :name => "cheat[name]"
      assert_select "input#cheat_preview[value='Lorem ipsum...']", :name => "cheat[preview]"
      assert_select "option", :text => "Sample Category"
      assert_select "input#cheat_position[value='1']", :name => "cheat[position]"
    end
  end
end