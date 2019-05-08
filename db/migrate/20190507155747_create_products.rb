class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.boolean :available, null: false
      t.text :description
      t.decimal :price, precision: 15, scale: 2

      t.timestamps
    end
  end
end
