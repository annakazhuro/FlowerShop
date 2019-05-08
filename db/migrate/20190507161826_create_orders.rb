class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :order_date, null: false
      t.decimal :sub_total, precision: 15, scale: 2
      t.text :comment

      t.timestamps
    end
  end
end
