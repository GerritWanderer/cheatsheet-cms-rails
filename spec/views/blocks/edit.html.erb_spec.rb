require 'spec_helper'

describe "blocks/edit.html.erb" do
  before(:each) do
    @block = Block.make
  end

  it "renders the edit block form" do
    render

    assert_select "form", :action => block_path(@block), :method => "post" do
      assert_select "input#block_name[value='Sample Block']", :name => "block[name]"
      assert_select "option[selected='selected'][value='left']"
      assert_select "input#block_position[value='1']", :name => "block[position]"
    end
  end
end
