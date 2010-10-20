require 'spec_helper'

describe "blocks/show.html.erb" do
  before(:each) do
    @block = Block.make
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Sample Block/)
    rendered.should match(/left/)
    rendered.should match(/1/)
  end
end