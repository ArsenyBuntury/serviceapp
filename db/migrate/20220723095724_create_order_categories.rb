class CreateOrderCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :order_categories do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :order_categories, [:order_id, :category_id], unique: true 
  end
end
