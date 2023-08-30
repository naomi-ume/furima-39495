class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def show
  end
end

private

  def item_params
    params.require(:item).permit(:item_name, :price, :description, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id,
      :shipping_date_id, :image).merge(user_id: current_user.id)
  end