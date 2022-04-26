class RemoveCustomerToProduct < ActiveRecord::Migration[7.0]
  def up
    remove_column :products, :customer_id, :integer
  end
  def down
    add_column :products, :customer_id, :integer
  end
end
