class AddNameAndDescriptionToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :price, :integer
    add_reference :items, :user, null: false, foreign_key: true
    add_column :items, :condition_id, :integer
    add_column :items, :category_id, :integer
    add_column :items, :shipping_fee_id, :integer
    add_column :items, :prefecture_id, :integer
    add_column :items, :shipping_date_id, :integer
  end
end
