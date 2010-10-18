require 'spec_helper'

describe "sheets/new.html.erb" do
  before(:each) do
    assign(:sheet, stub_model(Sheet,
      :new_record? => true,
      :name => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders new sheet form" do
    render
    
    pending
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => sheets_path, :method => "post" do
      assert_select "input#sheet_name", :name => "sheet[name]"
      assert_select "textarea#sheet_description", :name => "sheet[description]"
      assert_select "input#sheet_user", :name => "sheet[user]"
    end
  end
end
