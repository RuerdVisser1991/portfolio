class ItemsController < ApplicationController
  def index
  	@items = Item.all()
  end

  def new
  	@item = Item.new()
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
  	@item = Item.find(params[:id])
  	@item.destroy
  	 
  	redirect_to items_path
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to items_path
  	end
  end

  private
  	def item_params
  		params.require(:item).permit(:title, :description, :url)
  	end
end
