require 'spec_helper'

describe "sheets/index.html.erb" do
  before(:each) do
    assign(:sheets, [
      stub_model(Sheet,
        :name => "Name",
        :description => "MyText",
        :user => stub_model(User, :email => "test@example.org")
      ),
      stub_model(Sheet,
        :name => "Name",
        :description => "MyText",
        :user => stub_model(User, :email => "test@example.org")
      )
    ])
  end

  it "renders a list of sheets" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "test@example.org".to_s, :count => 2
  end
end
