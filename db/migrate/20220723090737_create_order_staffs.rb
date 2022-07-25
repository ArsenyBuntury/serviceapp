class CreateOrderStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :order_staffs do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :staff, null: false, foreign_key: true

      t.timestamps
    end
    add_index :order_staffs, [:order_id, :staff_id], unique: true 
  end
end
