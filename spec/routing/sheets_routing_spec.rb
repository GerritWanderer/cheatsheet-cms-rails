require "spec_helper"

describe SheetsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/cheatsheets" }.should route_to(:controller => "sheets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cheatsheets/new" }.should route_to(:controller => "sheets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cheatsheets/1" }.should route_to(:controller => "sheets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cheatsheets/1/edit" }.should route_to(:controller => "sheets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cheatsheets" }.should route_to(:controller => "sheets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/cheatsheets/1" }.should route_to(:controller => "sheets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cheatsheets/1" }.should route_to(:controller => "sheets", :action => "destroy", :id => "1")
    end

  end
end
