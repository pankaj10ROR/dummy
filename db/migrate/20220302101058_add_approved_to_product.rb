class AddApprovedToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :approved, :boolean, :default => false, :null => false
  end
end
