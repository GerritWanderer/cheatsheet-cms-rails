require 'spec_helper'

describe "sheets/edit.html.erb" do
  before(:each) do
    @sheet = Sheet.make
  end

  it "renders the edit sheet form" do
    render
    assert_select "form", :action => sheet_path(@sheet), :method => "post" do
      assert_select "input#sheet_name[value='Sample Cheatsheet']", :name => "sheet[name]"
      assert_select "textarea#sheet_description", :name => "sheet[description]", :text => "Lorem ipsum..."
      #pending assert_select "input#sheet_user", :name => "sheet[user]"
    end
  end
end
