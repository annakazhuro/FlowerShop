class ChangeColumnNameAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :address, :phone
  end
end
