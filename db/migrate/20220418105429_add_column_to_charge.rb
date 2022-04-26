class AddColumnToCharge < ActiveRecord::Migration[7.0]
  def change
    add_column :charges, :order_id, :integer
  end
end
