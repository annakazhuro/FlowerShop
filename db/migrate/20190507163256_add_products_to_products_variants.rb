class AddProductsToProductsVariants < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_variants, :products, foreign_key: true
  end
end
