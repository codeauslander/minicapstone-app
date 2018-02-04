class RemoveProductIdAndQuantityFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :product_id, :integer
    remove_column :orders, :quantity, :integer
    # add_column :carted_products, :status, :string, default: "carted"
  end
end
