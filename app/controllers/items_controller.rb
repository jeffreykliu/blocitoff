class ItemsController < ApplicationController
  
  def new
    @list = current_user.list
    @item = Item.new
  end

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

  private

  def item_params
    params.require(:item).permit(:name)
  end
end