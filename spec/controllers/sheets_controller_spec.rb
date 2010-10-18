require 'spec_helper'

describe SheetsController do
  include Devise::TestHelpers
  before(:each) do
    user = double('user')
    controller.stub(:current_user) { user }
    user.stub(:id) { 1 }
  end
  
  def mock_sheet(stubs={})
    @mock_sheet ||= mock_model(Sheet, stubs).as_null_object
  end
  
  describe "GET index" do
    it "assigns all sheets as @sheets" do
      Sheet.stub(:find_all_by_user_id) { [mock_sheet] }
      get :index
      assigns(:sheets).should eq([mock_sheet])
    end
  end
  describe "GET show" do
    it "assigns the requested sheet as @sheet" do
      Sheet.stub(:find).with("37") { mock_sheet }
      Sheet.stub(:find_all_by_user_id) { [mock_sheet] }
      get :show, :id => "37"
      assigns(:sheet).should be(mock_sheet)
      assigns(:sheets).should eq([mock_sheet])
    end
  end

  describe "GET new" do
    it "assigns a new sheet as @sheet" do
      Sheet.stub(:new) { mock_sheet }
      get :new
      assigns(:sheet).should be(mock_sheet)
    end
  end
  describe "GET edit" do
    it "assigns the requested sheet as @sheet" do
      Sheet.stub(:find).with("37") { mock_sheet }
      get :edit, :id => "37"
      assigns(:sheet).should be(mock_sheet)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created sheet as @sheet" do
        Sheet.stub(:new).with({'name' => 'Sample Sheet', 'user_id' => 1}) { mock_sheet(:save => true) }
        post :create, :sheet => {'name' => 'Sample Sheet'}
        assigns(:sheet).should be(mock_sheet)
      end

      it "redirects to the created sheet" do
        Sheet.stub(:new) { mock_sheet(:save => true) }
        post :create, :sheet => {}
        response.should redirect_to(sheet_url(mock_sheet))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sheet as @sheet" do
        Sheet.stub(:new).with({'name' => 'SS', 'user_id' => 1}) { mock_sheet(:save => false) }
        post :create, :sheet => {'name' => 'SS'}
        assigns(:sheet).should be(mock_sheet)
      end

      it "re-renders the 'new' template" do
        Sheet.stub(:new) { mock_sheet(:save => false) }
        post :create, :sheet => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sheet" do
        Sheet.should_receive(:find).with("37") { mock_sheet }
        mock_sheet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sheet => {'these' => 'params'}
      end

      it "assigns the requested sheet as @sheet" do
        Sheet.stub(:find) { mock_sheet(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:sheet).should be(mock_sheet)
      end

      it "redirects to the sheet" do
        Sheet.stub(:find) { mock_sheet(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(sheet_url(mock_sheet))
      end
    end

    describe "with invalid params" do
      it "assigns the sheet as @sheet" do
        Sheet.stub(:find) { mock_sheet(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:sheet).should be(mock_sheet)
      end

      it "re-renders the 'edit' template" do
        Sheet.stub(:find) { mock_sheet(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sheet" do
      Sheet.should_receive(:find).with("37") { mock_sheet }
      mock_sheet.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sheets list" do
      Sheet.stub(:find) { mock_sheet }
      delete :destroy, :id => "1"
      response.should redirect_to(sheets_url)
    end
  end

end
