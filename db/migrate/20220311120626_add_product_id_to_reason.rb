class AddProductIdToReason < ActiveRecord::Migration[7.0]
  def change
    add_column :reasons, :product_id, :integer
  end
end
