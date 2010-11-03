require 'spec_helper'

describe "categories/show.html.erb" do
  before(:each) do
    @category = Category.make
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Sample Category/)
    rendered.should match(/left/)
    rendered.should match(/1/)
  end
end