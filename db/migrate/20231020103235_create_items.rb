class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      add_column :items, :image, :string
      t.timestamps
    end
  end
end
