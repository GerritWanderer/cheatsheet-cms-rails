class BlocksController < ApplicationController
  respond_to :html
  
  def index
    @blocks = Block.all
    self.set_respond
  end

  def show
    @block = Block.find(params[:id])
    self.set_respond
  end
  
  def new
    @block = Block.new
    self.set_respond
  end

  def edit
    @block = Block.find(params[:id])
    self.set_respond
  end

  def create
    @block = Block.new(params[:block])
    @block.save ? flash[:notice] = "Block was successfully created" : flash[:warning] = "Block was NOT created"
    self.set_respond
  end

  def update
    @block = Block.find(params[:id])
    @block.update_attributes(params[:block]) ? flash[:notice] = "Block was successfully updated" : flash[:warning] = "Block was NOT updated"
    self.set_respond
  end

  def destroy
    @block = Block.find(params[:id])
    @block.destroy
    if request.path_info.split(/\//)[1] != self.controller_name
      redirect_to Sheet.find(params[:sheet_id])
    else
      redirect_to blocks_path
    end
  end
  
  protected
  def set_respond
    if request.path_info.split(/\//)[1] != self.controller_name
      @sheet = Sheet.find(params[:sheet_id]) if params[:sheet_id]
      @sheets = Sheet.find_all_by_user_id(current_user.id)
      if params[:block]
        #If Update/Create Action
        redirect_to sheet_path(@sheet)
      else
        #Basic Response for index/show/edit
        respond_with(@block) do |format|
          format.html { render :layout => "cheatsheet" }
        end
      end
    else
      respond_with @block
    end
  end
end