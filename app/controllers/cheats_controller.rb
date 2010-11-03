class CheatsController < ApplicationController
  respond_to :html
  
  def index
    @cheats = Cheat.all
    self.set_respond
  end

  def show
    @cheat = Cheat.find(params[:id])
    self.set_respond
  end
  
  def new
    @cheat = Cheat.new
    @categories = Category.find_all_by_sheet_id(params[:sheet_id])
    self.set_respond
  end
  
  def edit
    @cheat = Cheat.find(params[:id])
    @categories = Category.find_all_by_sheet_id(params[:sheet_id])
    self.set_respond
  end

  def create
    @cheat = Cheat.new(params[:cheat])
    @cheat.save ? flash[:notice] = "Cheat was successfully created" : flash[:warning] = "Cheat was NOT created"
    self.set_respond
  end

  def update
    @cheat = Cheat.find(params[:id])
    @cheat.update_attributes(params[:cheat]) ? flash[:notice] = "Cheat was successfully updated" : flash[:warning] = "Cheat was NOT updated"
    self.set_respond
  end

  def destroy
    @cheat = Cheat.find(params[:id])
    @cheat.destroy
    if request.path_info.split(/\//)[1] != self.controller_name
      redirect_to Sheet.find(params[:sheet_id])
    else
      redirect_to cheats_path
    end
  end
  
  protected
  def set_respond
    if request.path_info.split(/\//)[1] != self.controller_name
      @sheet = Sheet.find(params[:sheet_id]) if params[:sheet_id]
      @sheets = Sheet.find_all_by_user_id(current_user.id)
      if params[:cheat]
        #If Update/Create Action
        redirect_to sheet_path(@sheet)
      else
        #Basic Response for index/show/edit
        respond_with(@cheat) do |format|
          format.html { render :layout => "cheatsheet" }
        end
      end
    else
      respond_with @cheat
    end
  end
end
