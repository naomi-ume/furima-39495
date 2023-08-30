class Item < ApplicationRecord
belongs_to :user


with_options presence: true do
  validates :user
  validates :item_name
  validates :price
  validates :description
  validates :category_id
  validates :condition_id
  validates :shipping_cost_id
  validates :prefecture_id
  validates :shipping_date_id
  validates :image
end

end
