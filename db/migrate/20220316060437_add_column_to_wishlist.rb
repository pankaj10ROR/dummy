class AddColumnToWishlist < ActiveRecord::Migration[7.0]
  def change
    add_column :wishlists, :customer_id, :integer
  end
end
