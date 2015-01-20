class ItemsController < ApplicationController
  respond_to :html, :js

  def create
    @list = current_user.list
    @item = @list.items.build(item_params)
    @item.list = @list

    if @item.save
      flash[:notice] =  "Item was created."
      redirect_to @list
    else
      flash[:error] = "Error saving item. Please try again."
      redirect_to @list
    end
  end

  def destroy
    @list = current_user.list
    @item = @list.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was removed."
    else
      flash[:error] = "Item couldn't be deleted. Try again."
    end
 
    respond_with(@item) do |format|
      format.html { redirect_to @list }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end