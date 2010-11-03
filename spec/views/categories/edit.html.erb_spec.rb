require 'spec_helper'

describe "categories/edit.html.erb" do
  before(:each) do
    @category = Category.make
  end

  it "renders the edit category form" do
    render
    assert_select "form", :action => category_path(@category), :method => "post" do
      assert_select "input#category_name[value='Sample Category']", :name => "category[name]"
      assert_select "option[selected='selected'][value='left']"
      assert_select "input#category_position[value='1']", :name => "category[position]"
    end
  end
end