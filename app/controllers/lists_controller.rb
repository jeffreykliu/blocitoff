class ListsController < ApplicationController
  before_action :authenticate_user! # users must be signed in before any lists_controller method

  def show
    @list = current_user.list
    @items = @list.items
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.build_list(list_params)
    if @list.save
      flash[:notice] =  "List was saved successfully."
      redirect_to @list
    else
      flash[:error] = "Error saving list. Please try again."
      render :new
    end
  end

  def edit
    @list = current_user.list
  end

  def update
    @list = current_user.list

    if @list.update_attributes(list_params)
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "Error saving list. Please try again."
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end