class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_date

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipping_date_id
  end

  with_options presence: true do
    validates :item_name
    validates :price
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :image
  end
end
