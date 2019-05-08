class CreateProductSubcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_subcategories do |t|
      t.belongs_to :products, foreign_key: true
      t.belongs_to :subcategories, foreign_key: true
      t.belongs_to :categories, foreign_key: true

      t.timestamps
    end
  end
end
