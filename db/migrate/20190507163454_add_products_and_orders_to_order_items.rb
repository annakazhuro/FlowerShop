class AddProductsAndOrdersToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :products, foreign_key: true
    add_reference :order_items, :orders, foreign_key: true
  end
end
