class AddCustomerIdToCart < ActiveRecord::Migration[7.0]
  def up
    add_column :carts, :customer_id, :integer
  end
  def down
    remove_column :carts, :customer_id, :integer
  end
end

