require 'spec_helper'

describe "blocks/new.html.erb" do
  before(:each) do
    @block = Block.make
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
