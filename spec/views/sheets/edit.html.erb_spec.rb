require 'spec_helper'

describe "sheets/edit.html.erb" do
  before(:each) do
    @sheet = assign(:sheet, stub_model(Sheet,
      :new_record? => false,
      :name => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit sheet form" do
    render
    
    pending
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => sheet_path(@sheet), :method => "post" do
      assert_select "input#sheet_name", :name => "sheet[name]"
      assert_select "textarea#sheet_description", :name => "sheet[description]"
      pending assert_select "input#sheet_user", :name => "sheet[user]"
    end
  end
end
