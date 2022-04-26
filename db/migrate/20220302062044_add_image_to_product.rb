class AddImageToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :image, :string
    add_reference :products, :seller, foreign_key: true
  end
end
