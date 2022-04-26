class CreateWishItems < ActiveRecord::Migration[7.0]
  def change
    create_table :wish_items do |t|
      t.integer :quantity, default: 1
      t.integer :product_id
      t.integer :wishlist_id

      t.timestamps
    end
  end
end
