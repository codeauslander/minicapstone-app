class RenameOnStockToProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :on_sale, :in_stock
  end
end
