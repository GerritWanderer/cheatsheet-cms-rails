require 'spec_helper'

describe "categories/index.html.erb" do
  before(:each) do
    @categories = Category.make(2)
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Sample Category".to_s, :count => 2
    assert_select "tr>td", :text => "left".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    #assert_select "tr>td", :text => "Test Cheatsheet".to_s, :count => 2
  end
end
