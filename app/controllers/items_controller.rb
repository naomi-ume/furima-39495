class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :search_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :description, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def search_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id && @item.order.nil?
  end
end
