class CreateExecutors < ActiveRecord::Migration[7.0]
  def change
    create_table :executors do |t|
      t.string :fio

      t.timestamps
    end
  end
end
