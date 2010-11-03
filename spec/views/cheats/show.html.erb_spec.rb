require 'spec_helper'

describe "cheats/show.html.erb" do
  before(:each) do
      @cheat = Cheat.make
    end

    it "renders attributes in <p>" do
      render
      rendered.should match(/Sample Cheat/)
      rendered.should match(/Lorem ipsum.../)
    end
end
