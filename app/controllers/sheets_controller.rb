class SheetsController < ApplicationController
  respond_to :html
  
  def index
    @sheets = Sheet.find_all_by_user_id(current_user.id)
    @sheets = Sheet.all
    respond_with @sheets
  end

  def show
    @sheet = Sheet.find(params[:id])
    @sheets = Sheet.find_all_by_user_id(current_user.id)
    @sheets = Sheet.all
    respond_with(@sheet) do |format|
      format.html { render :layout => "cheatsheet" }
    end
  end

  def new
    @sheet = Sheet.new
    respond_with @sheet
  end

  def edit
    @sheet = Sheet.find(params[:id])
    respond_with @sheet
  end

  def create
    params[:sheet][:user_id] = current_user.id
    @sheet = Sheet.new(params[:sheet])
    if @sheet.save
      flash[:notice] = "Sheet was successfully created"
      respond_with @sheet
    else
      flash[:notice] = "Sheet was NOT created"
      respond_with(@sheet) do |format|
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @sheet = Sheet.find(params[:id])
    if @sheet.update_attributes(params[:sheet])
      flash[:notice] = "Sheet was successfully updated"  
    end  
    respond_with @sheet
  end

  def destroy
    @sheet = Sheet.find(params[:id])
    @sheet.destroy
    flash[:notice] = "Sheet was successfully deleted"#
    redirect_to sheets_path
  end
end
