require 'spec_helper'

describe "blocks/edit.html.erb" do
  before(:each) do
    @block = assign(:block, stub_model(Block,
      :new_record? => false,
      :name => "MyString",
      :column => "MyString",
      :position => 1,
      :sheet => stub_model(Sheet, :name => "Test Cheatsheet")
    ))
  end

  it "renders the edit block form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => block_path(@block), :method => "post" do
      assert_select "input#block_name", :name => "block[name]"
      assert_select "select#block_column", :name => "block[column]"
      assert_select "input#block_position", :name => "block[position]"
      assert_select "select#block_sheet_id", :name => "block[sheet_id]"
    end
  end
end
