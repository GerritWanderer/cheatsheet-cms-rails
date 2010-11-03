require 'spec_helper'

describe "categories/new.html.erb" do
  before(:each) do
    @category = Category.make
  end

  it "renders new category form" do
    render

    assert_select "form", :action => categories_path, :method => "post" do
      assert_select "input#category_name", :name => "category[name]"
      assert_select "select#category_column", :name => "category[column]"
      assert_select "input#category_position", :name => "category[position]"
      assert_select "select#category_sheet_id", :name => "category[sheet_id]"
    end
  end
end