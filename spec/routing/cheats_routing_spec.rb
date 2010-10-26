require "spec_helper"

describe CheatsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/cheats" }.should route_to(:controller => "cheats", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cheats/new" }.should route_to(:controller => "cheats", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cheats/1" }.should route_to(:controller => "cheats", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cheats/1/edit" }.should route_to(:controller => "cheats", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cheats" }.should route_to(:controller => "cheats", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/cheats/1" }.should route_to(:controller => "cheats", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cheats/1" }.should route_to(:controller => "cheats", :action => "destroy", :id => "1")
    end

  end
end
