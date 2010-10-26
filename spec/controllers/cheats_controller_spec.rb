require 'spec_helper'

describe CheatsController do

  def mock_cheat(stubs={})
    @mock_cheat ||= mock_model(Cheat, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all cheats as @cheats" do
      Cheat.stub(:all) { [mock_cheat] }
      get :index
      assigns(:cheats).should eq([mock_cheat])
    end
  end

  describe "GET show" do
    it "assigns the requested cheat as @cheat" do
      Cheat.stub(:find).with("37") { mock_cheat }
      get :show, :id => "37"
      assigns(:cheat).should be(mock_cheat)
    end
  end

  describe "GET new" do
    it "assigns a new cheat as @cheat" do
      Cheat.stub(:new) { mock_cheat }
      get :new
      assigns(:cheat).should be(mock_cheat)
    end
  end

  describe "GET edit" do
    it "assigns the requested cheat as @cheat" do
      Cheat.stub(:find).with("37") { mock_cheat }
      get :edit, :id => "37"
      assigns(:cheat).should be(mock_cheat)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created cheat as @cheat" do
        Cheat.stub(:new).with({'these' => 'params'}) { mock_cheat(:save => true) }
        post :create, :cheat => {'these' => 'params'}
        assigns(:cheat).should be(mock_cheat)
      end

      it "redirects to the created cheat" do
        Cheat.stub(:new) { mock_cheat(:save => true) }
        post :create, :cheat => {}
        response.should redirect_to(cheat_url(mock_cheat))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cheat as @cheat" do
        Cheat.stub(:new).with({'these' => 'params'}) { mock_cheat(:save => false) }
        post :create, :cheat => {'these' => 'params'}
        assigns(:cheat).should be(mock_cheat)
      end

      it "re-renders the 'new' template" do
        Cheat.stub(:new) { mock_cheat(:save => false) }
        post :create, :cheat => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested cheat" do
        Cheat.should_receive(:find).with("37") { mock_cheat }
        mock_cheat.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cheat => {'these' => 'params'}
      end

      it "assigns the requested cheat as @cheat" do
        Cheat.stub(:find) { mock_cheat(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:cheat).should be(mock_cheat)
      end

      it "redirects to the cheat" do
        Cheat.stub(:find) { mock_cheat(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(cheat_url(mock_cheat))
      end
    end

    describe "with invalid params" do
      it "assigns the cheat as @cheat" do
        Cheat.stub(:find) { mock_cheat(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:cheat).should be(mock_cheat)
      end

      it "re-renders the 'edit' template" do
        Cheat.stub(:find) { mock_cheat(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested cheat" do
      Cheat.should_receive(:find).with("37") { mock_cheat }
      mock_cheat.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the cheats list" do
      Cheat.stub(:find) { mock_cheat }
      delete :destroy, :id => "1"
      response.should redirect_to(cheats_url)
    end
  end

end
