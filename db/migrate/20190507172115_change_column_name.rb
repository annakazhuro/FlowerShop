class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_items, :products_id, :product_id
    rename_column :order_items, :orders_id, :order_id
    rename_column :product_subcategories, :products_id, :product_id
    rename_column :product_subcategories, :subcategories_id, :subcategory_id
    rename_column :product_subcategories, :categories_id, :category_id
    rename_column :product_variants, :products_id, :product_id
  end
end
