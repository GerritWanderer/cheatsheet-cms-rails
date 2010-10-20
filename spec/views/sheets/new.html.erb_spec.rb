require 'spec_helper'

describe "sheets/new.html.erb" do
  before(:each) do
    @sheet = Sheet.make
  end
  it "renders new sheet form" do
    render
    assert_select "form", :action => sheets_path, :method => "post" do
      assert_select "input#sheet_name", :name => "sheet[name]"
      assert_select "textarea#sheet_description", :name => "sheet[description]"
    end
  end
end