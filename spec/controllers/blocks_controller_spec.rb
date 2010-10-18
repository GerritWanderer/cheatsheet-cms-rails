require 'spec_helper'

describe BlocksController do

  def mock_block(stubs={})
    @mock_block ||= mock_model(Block, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all blocks as @blocks" do
      Block.stub(:all) { [mock_block] }
      get :index
      assigns(:blocks).should eq([mock_block])
    end
  end

  describe "GET show" do
    it "assigns the requested block as @block" do
      Block.stub(:find).with("37") { mock_block }
      get :show, :id => "37"
      assigns(:block).should be(mock_block)
    end
  end

  describe "GET new" do
    it "assigns a new block as @block" do
      Block.stub(:new) { mock_block }
      get :new
      assigns(:block).should be(mock_block)
    end
  end

  describe "GET edit" do
    it "assigns the requested block as @block" do
      Block.stub(:find).with("37") { mock_block }
      get :edit, :id => "37"
      assigns(:block).should be(mock_block)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created block as @block" do
        Block.stub(:new).with({'these' => 'params'}) { mock_block(:save => true) }
        post :create, :block => {'these' => 'params'}
        assigns(:block).should be(mock_block)
      end

      it "redirects to the created block" do
        Block.stub(:new) { mock_block(:save => true) }
        post :create, :block => {}
        response.should redirect_to(block_url(mock_block))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved block as @block" do
        Block.stub(:new).with({'these' => 'params'}) { mock_block(:save => false) }
        post :create, :block => {'these' => 'params'}
        assigns(:block).should be(mock_block)
      end

      it "re-renders the 'new' template" do
        Block.stub(:new) { mock_block(:save => false) }
        post :create, :block => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested block" do
        Block.should_receive(:find).with("37") { mock_block }
        mock_block.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :block => {'these' => 'params'}
      end

      it "assigns the requested block as @block" do
        Block.stub(:find) { mock_block(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:block).should be(mock_block)
      end

      it "redirects to the block" do
        Block.stub(:find) { mock_block(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(block_url(mock_block))
      end
    end

    describe "with invalid params" do
      it "assigns the block as @block" do
        Block.stub(:find) { mock_block(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:block).should be(mock_block)
      end

      it "re-renders the 'edit' template" do
        Block.stub(:find) { mock_block(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested block" do
      Block.should_receive(:find).with("37") { mock_block }
      mock_block.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the blocks list" do
      Block.stub(:find) { mock_block }
      delete :destroy, :id => "1"
      response.should redirect_to(blocks_url)
    end
  end

end
