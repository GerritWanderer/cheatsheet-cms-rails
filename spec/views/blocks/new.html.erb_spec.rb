require 'spec_helper'

describe "blocks/new.html.erb" do
  before(:each) do
    assign(:block, stub_model(Block,
      :new_record? => true,
      :name => "Test Cheatsheet",
      :column => "left",
      :position => 1,
      :sheet => nil
    ))
  end

  it "renders new block form" do
    render

    assert_select "form", :action => blocks_path, :method => "post" do
      assert_select "input#block_name", :name => "block[name]"
      assert_select "select#block_column", :name => "block[column]"
      assert_select "input#block_position", :name => "block[position]"
      assert_select "select#block_sheet_id", :name => "block[sheet_id]"
    end
  end
end
