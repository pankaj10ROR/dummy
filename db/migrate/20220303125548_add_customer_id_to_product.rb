class AddCustomerIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :customer_id, :integer
  end
end
