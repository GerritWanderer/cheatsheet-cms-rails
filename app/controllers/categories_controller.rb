class CategoriesController < ApplicationController
  respond_to :html
  
  def index
    @categories = Category.all
    self.set_respond
  end

  def show
    @category = Category.find(params[:id])
    self.set_respond
  end
  
  def new
    @category = Category.new
    self.set_respond
  end

  def edit
    @category = Category.find(params[:id])
    self.set_respond
  end

  def create
    @category = Category.new(params[:category])
    @category.save ? flash[:notice] = "Category was successfully created" : flash[:warning] = "Category was NOT created"
    self.set_respond
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category]) ? flash[:notice] = "Category was successfully updated" : flash[:warning] = "Category was NOT updated"
    self.set_respond
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    if request.path_info.split(/\//)[1] != self.controller_name
      redirect_to Sheet.find(params[:sheet_id])
    else
      redirect_to categories_path
    end
  end
  
  protected
  def set_respond
    if request.path_info.split(/\//)[1] != self.controller_name
      @sheet = Sheet.find(params[:sheet_id]) if params[:sheet_id]
      @sheets = Sheet.find_all_by_user_id(current_user.id)
      if params[:category]
        #If Update/Create Action
        redirect_to sheet_path(@sheet)
      else
        #Basic Response for index/show/edit
        respond_with(@category) do |format|
          format.html { render :layout => "cheatsheet" }
        end
      end
    else
      respond_with @category
    end
  end
end