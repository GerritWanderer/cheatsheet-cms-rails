require 'spec_helper'

describe "cheats/new.html.erb" do
  before(:each) do
    @cheat = Cheat.make
    @categories = Category.make(2)
  end

  it "renders new cheat form" do
    render
    assert_select "form", :action => cheats_path, :method => "post" do
      assert_select "input#cheat_name", :name => "cheat[name]"
      assert_select "input#cheat_preview", :name => "cheat[preview]"
      assert_select "input#cheat_position", :name => "cheat[position]"
      assert_select "select#cheat_category_id", :name => "cheat[category_id]"
    end
  end
end