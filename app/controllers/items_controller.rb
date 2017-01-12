class ItemsController < ApplicationController

  before_filter :authorize, :except => [:index, :show] #blokkeert alles behalve index en show voor niet ingelogde users (zie applicatoin-controller)

  def index
    if params[:search]
      @items = Item.search(params[:search]).order("created_at DESC")
    else
      @items = Item.all.order('created_at DESC')
    end
  end

  def new
  	@item = Item.new()
  end

  def show
  end

	def edit
		item = Item.find(params[:id])
	end

  def destroy
	@item = Item.find(params[:id])
	@item.destroy
	 
	redirect_to items_path
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to items_path
  	end
  end

  private
  	def item_params
  		params.require(:item).permit(:title, :description, :url, :portfolio_image, :category_ids => []) #[] is voor array!
  	end
end
