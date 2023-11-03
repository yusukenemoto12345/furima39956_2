class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :item_image

  validates :name, presence: true
  validates :item_image, presence: true
  validates :condition_id, presence: true
  validates :category_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
  validates :description, presence: true
end

