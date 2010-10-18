require "spec_helper"

describe BlocksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/blocks" }.should route_to(:controller => "blocks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/blocks/new" }.should route_to(:controller => "blocks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/blocks/1" }.should route_to(:controller => "blocks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/blocks/1/edit" }.should route_to(:controller => "blocks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/blocks" }.should route_to(:controller => "blocks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/blocks/1" }.should route_to(:controller => "blocks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/blocks/1" }.should route_to(:controller => "blocks", :action => "destroy", :id => "1")
    end

  end
end
